import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:krypt/data/services/firebase_authentication_service.dart';
import 'package:krypt/data/services/solana_service.dart';
import 'package:krypt/util/exception.dart';
import 'package:krypt/util/logging/app_logger.dart';

part 'sign_up_screen_state.dart';

part 'sign_up_screen_cubit.freezed.dart';

@Injectable()
class SignUpScreenCubit extends Cubit<SignUpScreenState> {
  final FirebaseAuthenticationService _firebaseAuthService;
  final SolanaService _solanaService;

  SignUpScreenCubit(this._firebaseAuthService, this._solanaService) : super(const SignUpScreenState.initial());

  Future<void> createUserAccount({required String email, required String password}) async {
    emit(const SignUpScreenState.loading());
    try {
      // check if the inputted email is not taken
      final bool isEmailAvailable = await _firebaseAuthService.isEmailAvailable(email: email);
      if (!isEmailAvailable) {
        emit(const SignUpScreenState.error("User with that email already exists"));
      } else {
        final result = await _solanaService.createSolanaAccount();
        await _firebaseAuthService.signUpWithEmailAndPassword(
          email: email,
          password: password,
          publicKey: result.$1,
          address: result.$2,
        );
        emit(const SignUpScreenState.accountCreated());
      }
    } on AppFirebaseAuthException catch (e) {
      emit(SignUpScreenState.error(e.exceptionType.message));
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      emit(const SignUpScreenState.error('Something went wrong, please try again later'));
    }
  }

  Future<void> updateUserPasscode({required String passcode}) async {
    emit(const SignUpScreenState.loading());
    try {
      await _firebaseAuthService.updateUserPasscodeInfo(passcode: passcode);
      emit(const SignUpScreenState.accountInfoUpdated());
    } on AppFirebaseAuthException catch (e) {
      emit(SignUpScreenState.error(e.exceptionType.message));
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      emit(const SignUpScreenState.error('Something went wrong, please try again later'));
    }
  }

  Future<void> updateUserSelectedFiatCurrency({required String fiatCurrency}) async {
    emit(const SignUpScreenState.loading());
    try {
      await _firebaseAuthService.updateUserFiatCurrencyInfo(fiatCurrency: fiatCurrency);
      emit(const SignUpScreenState.accountInfoUpdated());
    } on AppFirebaseAuthException catch (e) {
      emit(SignUpScreenState.error(e.exceptionType.message));
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      emit(const SignUpScreenState.error('Something went wrong, please try again later'));
    }
  }
}
