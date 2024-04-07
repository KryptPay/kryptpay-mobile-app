part of 'login_screen_cubit.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState.initial() = _Initial;
  const factory LoginScreenState.loading() = _Loading;
  const factory LoginScreenState.loginSuccessful() = LoginSuccessfulState;
  const factory LoginScreenState.loginError(String errorMessage) = LoginErrorState;
}
