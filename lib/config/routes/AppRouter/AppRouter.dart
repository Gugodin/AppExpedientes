// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';

import 'AppRouter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: LoginRoute.page,),
        AutoRoute(page: OnBoardingRoute.page,initial: true,),
      ];
}
