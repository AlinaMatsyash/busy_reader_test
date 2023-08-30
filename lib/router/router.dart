import 'package:auto_route/auto_route.dart';
import 'package:busy_reader/screens/navigator_screen.dart';
import 'package:busy_reader/screens/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: NavigationRoute.page),
      ];
}
