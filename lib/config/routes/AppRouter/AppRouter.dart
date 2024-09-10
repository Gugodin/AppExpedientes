// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';

import 'AppRouter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: OnBoardingRoute.page ),
        AutoRoute(
          page: LoginRoute.page,
          initial: true
        ),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: AdminHomeRoute.page),
        AutoRoute(page: ClientHomeRoute.page)

      ];
}
