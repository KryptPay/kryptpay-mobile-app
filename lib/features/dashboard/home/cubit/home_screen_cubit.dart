import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:krypt/data/services/shared_preference_service.dart';
import 'package:krypt/data/services/solana_service.dart';
import 'package:krypt/util/logging/app_logger.dart';

part 'home_screen_state.dart';

part 'home_screen_cubit.freezed.dart';

@Singleton()
class HomeScreenCubit extends Cubit<HomeScreenState> {
  final SolanaService _solanaService;
  final SharedPreferencesService _sharedPref;

  HomeScreenCubit(this._solanaService, this._sharedPref) : super(const HomeScreenState.initial());

  Future<void> fetchUsersWalletBalance() async {
    if (_sharedPref.userEntity == null) return;
    emit(const HomeScreenState.loading());
    try {
      final String balance = await _solanaService.fetchWalletBalance(_sharedPref.userEntity!.address);
      emit(HomeScreenState.balanceFetched(balance));
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      emit(const HomeScreenState.balanceFetched("0.0"));
    }
  }

  Future<void> requestSOL() async {
    if (_sharedPref.userEntity == null) return;
    //emit(const HomeScreenState.loading());
    try {
      await _solanaService.requestAirdrop(_sharedPref.userEntity!.publicKey);
      //emit(HomeScreenState.balanceFetched(balance));
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
      //emit(const HomeScreenState.balanceFetched("0.0"));
    }
  }


}