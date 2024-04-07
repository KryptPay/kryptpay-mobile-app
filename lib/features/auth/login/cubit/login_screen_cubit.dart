import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:krypt/data/services/firebase_authentication_service.dart';
import 'package:krypt/util/exception.dart';
import 'package:krypt/util/logging/app_logger.dart';

part 'login_screen_state.dart';

part 'login_screen_cubit.freezed.dart';

@Injectable()
class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit(this._firebaseAuthService) : super(const LoginScreenState.initial());

  final FirebaseAuthenticationService _firebaseAuthService;

  Future<void> loginUser({required String email, required String password}) async {
    emit(const LoginScreenState.loading());
    try {
      await _firebaseAuthService.logInWithEmailAndPassword(email: email, password: password);
      emit(const LoginScreenState.loginSuccessful());
    } on AppFirebaseAuthException catch (e) {
      emit(LoginScreenState.loginError(e.exceptionType.message));
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      emit(const LoginScreenState.loginError('Something went wrong, please try again later'));
    }
  }
}
