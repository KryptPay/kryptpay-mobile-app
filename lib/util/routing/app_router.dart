import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:krypt/data/model/user_entity.dart';
import 'package:krypt/data/services/shared_preference_service.dart';
import 'package:krypt/features/auth/login/login_screen.dart';
import 'package:krypt/features/auth/sign-up/select_fiat_currency_screen.dart';
import 'package:krypt/features/auth/sign-up/set_up_passcode_authorization_screen.dart';
import 'package:krypt/features/auth/sign-up/sign_up_screen.dart';
import 'package:krypt/features/dashboard/dashboard_screen.dart';
import 'package:krypt/features/dashboard/market_place_screen.dart';
import 'package:krypt/features/dashboard/swap_asset_screen.dart';
import 'package:krypt/features/onboarding/onboarding_screen.dart';
import 'package:krypt/features/receive_token/receive_token_screen.dart';
import 'package:krypt/features/send_token/enter_amount_to_send_screen.dart';
import 'package:krypt/features/send_token/enter_recipient_address_screen.dart';
import 'package:krypt/features/send_token/send_token_screen.dart';
import 'package:krypt/features/send_token/send_token_summary_screen.dart';
import 'package:krypt/features/send_token/token_sent_successfully_screen.dart';
import 'package:krypt/features/shared/enter_passcode_screen.dart';
import 'package:krypt/util/logging/app_logger.dart';

import '../../features/scan/enter_address.dart';
import '../../features/scan/enter_amount.dart';
import '../../features/scan/enter_passcode.dart';
import '../../features/scan/scan_to_pay.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final SharedPreferencesService sharedPref;

  AppRouter({required this.sharedPref});

  bool get hasOnboarded => sharedPref.hasFinishedOnBoarding;

  String get _initialRoute {
    String initialRoute = '/onboarding-screen';
    if (!hasOnboarded && sharedPref.userEntity == null) {
      initialRoute = "/sign-up-screen";
    } else if (sharedPref.userEntity != null) {
      final UserEntity userEntity = sharedPref.userEntity!;
      if (userEntity.passcode.isEmpty) {
        initialRoute = "/set-up-passcode-screen";
      } else if (userEntity.fiatCurrency.isEmpty) {
        initialRoute = "/select-fiat-currency-screen";
      } else {
        initialRoute = "/dashboard-screen-route";
      }
    }
    AppLogger.debug("_initialRoute is $initialRoute");
    return initialRoute;
  }

  @override
  List<AutoRoute> get routes => [
        _buildRouteInfo(OnBoardingScreenRoute.page,
            initial: _initialRoute == "/onboarding-screen"),
        _buildRouteInfo(LoginScreenRoute.page),
        _buildRouteInfo(SignUpScreenRoute.page,
            initial: _initialRoute == "/sign-up-screen"),
        _buildRouteInfo(SetUpPassCodeAuthorizationScreenRoute.page,
            initial: _initialRoute == "/set-up-passcode-screen"),
        _buildRouteInfo(SelectFiatCurrencyScreenRoute.page,
            initial: _initialRoute == "/select-fiat-currency-screen"),
        _buildRouteInfo(DashboardScreenRoute.page,
            initial: _initialRoute == "/dashboard-screen-route"),
        _buildRouteInfo(SendTokenScreenRoute.page),
        _buildRouteInfo(ReceiveTokenScreenRoute.page),
        _buildRouteInfo(EnterRecipientAddressScreenRoute.page),
        _buildRouteInfo(EnterAmountToSendScreenRoute.page),
        _buildRouteInfo(SendTokenSummaryScreenRoute.page),
        _buildRouteInfo(EnterPasscodeScreenRoute.page),
        _buildRouteInfo(MarketScreenRoute.page),
        _buildRouteInfo(SwapAssetsScreenRoute.page),
        _buildRouteInfo(ScanToPayRoute.page),
        _buildRouteInfo(EnterAddressRoute.page),
        _buildRouteInfo(EnterAmountRoute.page),
        _buildRouteInfo(EnterPasscodeRoute.page),
      ];

  AutoRoute _buildRouteInfo(PageInfo<dynamic> pageInfo,
      {bool initial = false}) {
    return AutoRoute(
        page: pageInfo, path: "/${pageInfo.name}", initial: initial);
  }
}
