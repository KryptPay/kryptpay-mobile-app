part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.loading() = _Loading;
  const factory HomeScreenState.balanceFetched(String userBalance) = BalanceFetched;
  const factory HomeScreenState.error(String errorMessage) = Error;
}
