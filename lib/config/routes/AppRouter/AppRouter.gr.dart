// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:expedientes/ui/screens/admin_screens/home/admin_home_screen.dart'
    as _i1;
import 'package:expedientes/ui/screens/authentication_screens/login_screen/login_screen.dart'
    as _i3;
import 'package:expedientes/ui/screens/authentication_screens/on_boarding_screen/on_boarding_screen.dart'
    as _i4;
import 'package:expedientes/ui/screens/authentication_screens/register_screen/register_screen.dart'
    as _i5;
import 'package:expedientes/ui/screens/client_screens/home/client_home_screen.dart'
    as _i2;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AdminHomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminHomeScreen(),
      );
    },
    ClientHomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ClientHomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnBoardingScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminHomeScreen]
class AdminHomeRoute extends _i6.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ClientHomeScreen]
class ClientHomeRoute extends _i6.PageRouteInfo<void> {
  const ClientHomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ClientHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientHomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<LoginRouteArgs> page =
      _i6.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.OnBoardingScreen]
class OnBoardingRoute extends _i6.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
