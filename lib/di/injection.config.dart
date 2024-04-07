// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:krypt/data/services/firebase_authentication_service.dart'
    as _i10;
import 'package:krypt/data/services/firebase_firestore_service.dart' as _i5;
import 'package:krypt/data/services/shared_preference_service.dart' as _i7;
import 'package:krypt/data/services/solana_service.dart' as _i9;
import 'package:krypt/di/modules/app_module.dart' as _i14;
import 'package:krypt/features/auth/login/cubit/login_screen_cubit.dart'
    as _i12;
import 'package:krypt/features/auth/sign-up/cubit/sign_up_screen_cubit.dart'
    as _i13;
import 'package:krypt/features/dashboard/home/cubit/home_screen_cubit.dart'
    as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:solana/solana.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i4.FirebaseFirestore>(() => appModule.fireStore);
    gh.singleton<_i5.FirebaseFirestoreService>(
        () => _i5.FirebaseFirestoreService(gh<_i4.FirebaseFirestore>()));
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i7.SharedPreferencesService>(
        () => _i7.SharedPreferencesService(gh<_i6.SharedPreferences>()));
    gh.factory<_i8.SolanaClient>(() => appModule.solanaClient);
    gh.singleton<_i9.SolanaService>(
        () => _i9.SolanaService(gh<_i8.SolanaClient>()));
    gh.singleton<_i10.FirebaseAuthenticationService>(
        () => _i10.FirebaseAuthenticationService(
              firebaseAuth: gh<_i3.FirebaseAuth>(),
              firestoreService: gh<_i5.FirebaseFirestoreService>(),
              sharedPref: gh<_i7.SharedPreferencesService>(),
            ));
    gh.singleton<_i11.HomeScreenCubit>(() => _i11.HomeScreenCubit(
          gh<_i9.SolanaService>(),
          gh<_i7.SharedPreferencesService>(),
        ));
    gh.factory<_i12.LoginScreenCubit>(
        () => _i12.LoginScreenCubit(gh<_i10.FirebaseAuthenticationService>()));
    gh.factory<_i13.SignUpScreenCubit>(() => _i13.SignUpScreenCubit(
          gh<_i10.FirebaseAuthenticationService>(),
          gh<_i9.SolanaService>(),
        ));
    return this;
  }
}

class _$AppModule extends _i14.AppModule {}
