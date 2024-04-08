// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    EnterAddressRoute.name: (routeData) {
      final args = routeData.argsAs<EnterAddressRouteArgs>(
          orElse: () => const EnterAddressRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EnterAddress(key: args.key),
      );
    },
    EnterAmountRoute.name: (routeData) {
      final args = routeData.argsAs<EnterAmountRouteArgs>(
          orElse: () => const EnterAmountRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EnterAmount(key: args.key),
      );
    },
    EnterAmountToSendScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EnterAmountToSendScreen(),
      );
    },
    EnterPasscodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EnterPasscode(),
      );
    },
    EnterPasscodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EnterPasscodeScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EnterPasscodeScreen(
          key: args.key,
          onPasscodeValidated: args.onPasscodeValidated,
        ),
      );
    },
    EnterRecipientAddressScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EnterRecipientAddressScreenRouteArgs>(
          orElse: () => const EnterRecipientAddressScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EnterRecipientAddressScreen(key: args.key),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MarketScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MarketPlaceScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingScreen(),
      );
    },
    ReceiveTokenScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReceiveTokenScreen(),
      );
    },
    ScanToPayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScanToPay(),
      );
    },
    SelectFiatCurrencyScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectFiatCurrencyScreen(),
      );
    },
    SendTokenScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SendTokenScreen(),
      );
    },
    SendTokenSummaryScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SendTokenSummaryScreen(),
      );
    },
    SetUpPassCodeAuthorizationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SetUpPassCodeAuthorizationScreenRouteArgs>(
          orElse: () => const SetUpPassCodeAuthorizationScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SetUpPassCodeAuthorizationScreen(key: args.key),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SwapAssetsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SwapAssetsScreen(),
      );
    },
    TokenSentSuccessfullyScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TokenSentSuccessfullyScreen(),
      );
    },
  };
}

/// generated route for
/// [DashboardScreen]
class DashboardScreenRoute extends PageRouteInfo<void> {
  const DashboardScreenRoute({List<PageRouteInfo>? children})
      : super(
          DashboardScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EnterAddress]
class EnterAddressRoute extends PageRouteInfo<EnterAddressRouteArgs> {
  EnterAddressRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EnterAddressRoute.name,
          args: EnterAddressRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EnterAddressRoute';

  static const PageInfo<EnterAddressRouteArgs> page =
      PageInfo<EnterAddressRouteArgs>(name);
}

class EnterAddressRouteArgs {
  const EnterAddressRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EnterAddressRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EnterAmount]
class EnterAmountRoute extends PageRouteInfo<EnterAmountRouteArgs> {
  EnterAmountRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EnterAmountRoute.name,
          args: EnterAmountRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EnterAmountRoute';

  static const PageInfo<EnterAmountRouteArgs> page =
      PageInfo<EnterAmountRouteArgs>(name);
}

class EnterAmountRouteArgs {
  const EnterAmountRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EnterAmountRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EnterAmountToSendScreen]
class EnterAmountToSendScreenRoute extends PageRouteInfo<void> {
  const EnterAmountToSendScreenRoute({List<PageRouteInfo>? children})
      : super(
          EnterAmountToSendScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterAmountToSendScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EnterPasscode]
class EnterPasscodeRoute extends PageRouteInfo<void> {
  const EnterPasscodeRoute({List<PageRouteInfo>? children})
      : super(
          EnterPasscodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPasscodeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EnterPasscodeScreen]
class EnterPasscodeScreenRoute
    extends PageRouteInfo<EnterPasscodeScreenRouteArgs> {
  EnterPasscodeScreenRoute({
    Key? key,
    required void Function() onPasscodeValidated,
    List<PageRouteInfo>? children,
  }) : super(
          EnterPasscodeScreenRoute.name,
          args: EnterPasscodeScreenRouteArgs(
            key: key,
            onPasscodeValidated: onPasscodeValidated,
          ),
          initialChildren: children,
        );

  static const String name = 'EnterPasscodeScreenRoute';

  static const PageInfo<EnterPasscodeScreenRouteArgs> page =
      PageInfo<EnterPasscodeScreenRouteArgs>(name);
}

class EnterPasscodeScreenRouteArgs {
  const EnterPasscodeScreenRouteArgs({
    this.key,
    required this.onPasscodeValidated,
  });

  final Key? key;

  final void Function() onPasscodeValidated;

  @override
  String toString() {
    return 'EnterPasscodeScreenRouteArgs{key: $key, onPasscodeValidated: $onPasscodeValidated}';
  }
}

/// generated route for
/// [EnterRecipientAddressScreen]
class EnterRecipientAddressScreenRoute
    extends PageRouteInfo<EnterRecipientAddressScreenRouteArgs> {
  EnterRecipientAddressScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EnterRecipientAddressScreenRoute.name,
          args: EnterRecipientAddressScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EnterRecipientAddressScreenRoute';

  static const PageInfo<EnterRecipientAddressScreenRouteArgs> page =
      PageInfo<EnterRecipientAddressScreenRouteArgs>(name);
}

class EnterRecipientAddressScreenRouteArgs {
  const EnterRecipientAddressScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EnterRecipientAddressScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute({List<PageRouteInfo>? children})
      : super(
          LoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MarketPlaceScreen]
class MarketScreenRoute extends PageRouteInfo<void> {
  const MarketScreenRoute({List<PageRouteInfo>? children})
      : super(
          MarketScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarketScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingScreenRoute extends PageRouteInfo<void> {
  const OnBoardingScreenRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReceiveTokenScreen]
class ReceiveTokenScreenRoute extends PageRouteInfo<void> {
  const ReceiveTokenScreenRoute({List<PageRouteInfo>? children})
      : super(
          ReceiveTokenScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReceiveTokenScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScanToPay]
class ScanToPayRoute extends PageRouteInfo<void> {
  const ScanToPayRoute({List<PageRouteInfo>? children})
      : super(
          ScanToPayRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanToPayRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectFiatCurrencyScreen]
class SelectFiatCurrencyScreenRoute extends PageRouteInfo<void> {
  const SelectFiatCurrencyScreenRoute({List<PageRouteInfo>? children})
      : super(
          SelectFiatCurrencyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectFiatCurrencyScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SendTokenScreen]
class SendTokenScreenRoute extends PageRouteInfo<void> {
  const SendTokenScreenRoute({List<PageRouteInfo>? children})
      : super(
          SendTokenScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendTokenScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SendTokenSummaryScreen]
class SendTokenSummaryScreenRoute extends PageRouteInfo<void> {
  const SendTokenSummaryScreenRoute({List<PageRouteInfo>? children})
      : super(
          SendTokenSummaryScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendTokenSummaryScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetUpPassCodeAuthorizationScreen]
class SetUpPassCodeAuthorizationScreenRoute
    extends PageRouteInfo<SetUpPassCodeAuthorizationScreenRouteArgs> {
  SetUpPassCodeAuthorizationScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SetUpPassCodeAuthorizationScreenRoute.name,
          args: SetUpPassCodeAuthorizationScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SetUpPassCodeAuthorizationScreenRoute';

  static const PageInfo<SetUpPassCodeAuthorizationScreenRouteArgs> page =
      PageInfo<SetUpPassCodeAuthorizationScreenRouteArgs>(name);
}

class SetUpPassCodeAuthorizationScreenRouteArgs {
  const SetUpPassCodeAuthorizationScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SetUpPassCodeAuthorizationScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpScreen]
class SignUpScreenRoute extends PageRouteInfo<void> {
  const SignUpScreenRoute({List<PageRouteInfo>? children})
      : super(
          SignUpScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SwapAssetsScreen]
class SwapAssetsScreenRoute extends PageRouteInfo<void> {
  const SwapAssetsScreenRoute({List<PageRouteInfo>? children})
      : super(
          SwapAssetsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SwapAssetsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TokenSentSuccessfullyScreen]
class TokenSentSuccessfullyScreenRoute extends PageRouteInfo<void> {
  const TokenSentSuccessfullyScreenRoute({List<PageRouteInfo>? children})
      : super(
          TokenSentSuccessfullyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TokenSentSuccessfullyScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
