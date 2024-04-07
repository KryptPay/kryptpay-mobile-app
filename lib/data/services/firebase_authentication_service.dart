import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:krypt/data/model/user_entity.dart';
import 'package:krypt/data/services/firebase_firestore_service.dart';
import 'package:krypt/data/services/shared_preference_service.dart';
import 'package:krypt/util/exception.dart';
import 'package:krypt/util/logging/app_logger.dart';
import 'package:solana/solana.dart';

@singleton
class FirebaseAuthenticationService {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestoreService firestoreService;
  final SharedPreferencesService sharedPref;

  String get _collectionName => "auth-users";

  FirebaseAuthenticationService({
    required this.firebaseAuth,
    required this.firestoreService,
    required this.sharedPref,
  });

  Stream<bool> get authStateChanges {
    return firebaseAuth.authStateChanges().map((User? user) => user != null);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required Ed25519HDPublicKey publicKey,
    required String address,
  }) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        throw KryptAppException('User with that credential does not exists');
      }

      final encodedPublicKey = base64Url.encode(publicKey.bytes);

      UserEntity userEntity = UserEntity(
        id: userCredential.user!.uid,
        email: email,
        userPublicKeyInfo: {
          "publicKey": encodedPublicKey,
          "address": address,
        },
      );

      final userDocumentId = await firestoreService.save(_collectionName, userEntity.toJson());

      AppLogger.debug("userDocumentId is $userDocumentId");

      userEntity = userEntity.copyWith(documentID: userDocumentId ?? '');

      AppLogger.debug("updated user info is $userEntity");

      final updatedUserEntity = await updateUserInfo(userEntity);
      await sharedPref.saveUserInfo(updatedUserEntity);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      rethrow;
    }
  }

  Future<void> updateUserPasscodeInfo({required String passcode}) async {
    try {
      final UserEntity? currentUser = sharedPref.userEntity;

      if (currentUser == null) return;

      UserEntity userEntity = await getUserById(currentUser.documentID);

      userEntity = userEntity.copyWith(passcode: passcode);

      final updatedUserEntity = await updateUserInfo(userEntity);

      await sharedPref.saveUserInfo(updatedUserEntity);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      rethrow;
    }
  }

  Future<void> updateUserFiatCurrencyInfo({required String fiatCurrency}) async {
    try {
      final UserEntity? currentUser = sharedPref.userEntity;

      if (currentUser == null) return;

      UserEntity userEntity = await getUserById(currentUser.documentID);

      userEntity = userEntity.copyWith(fiatCurrency: fiatCurrency);

      final updatedUserEntity = await updateUserInfo(userEntity);

      await sharedPref.saveUserInfo(updatedUserEntity);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      rethrow;
    }
  }

  Future<void> logInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      AppLogger.debug("logged in user credential is ${userCredential.user}");

      if (userCredential.user == null) {
        throw KryptAppException('User with that account does not exist');
      }

      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestoreService.collection(_collectionName).where('email', isEqualTo: email).limit(1).get();

      if (querySnapshot.size > 0) {
        final UserEntity userEntity = UserEntity.fromJson(querySnapshot.docs.first.data());
        AppLogger.debug("userEntity is $userEntity");
        await sharedPref.saveUserInfo(userEntity);
      } else {
        throw KryptAppException('User with that account does not exist');
      }
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      rethrow;
    }
  }

  Future<UserEntity> getUserById(String documentId) async {
    AppLogger.debug("documentId is $documentId");

    final MapDocumentSnapshot doc = await firestoreService.fetchOne(_collectionName, documentId).get();

    if (!doc.exists) {
      throw KryptAppException('User with that account does not exist');
    }

    return UserEntity.fromJson(doc.data()!);
  }

  Future<UserEntity> updateUserInfo(UserEntity userEntity) async {
    firestoreService.update(_collectionName, userEntity.documentID, userEntity.toJson());
    return getUserById(userEntity.documentID);
  }

  Future<bool> isEmailAvailable({required String email}) async {
    final querySnapshot =
        await firestoreService.collection(_collectionName).where('email', isEqualTo: email).limit(1).get();

    return querySnapshot.docs.isEmpty;
  }
}
