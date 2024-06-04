import 'package:auto_route/auto_route.dart';

import 'AppRouter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: LoginRoute.page,initial: true)
      ];
}
