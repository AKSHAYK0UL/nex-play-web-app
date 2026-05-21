import 'package:go_router/go_router.dart';
import 'package:nex_play/features/auth/presentation/screens/landing_screen.dart';

final appRouter = GoRouter(
  initialLocation: RoutePath.landingPage,
  routes: [
    GoRoute(
      path: RoutePath.landingPage,
      name: RouteName.landingPage,
      builder: (context, state) => LandingScreen(),
    ),
    // GoRoute(
    //   path: RoutePath.landingPage,
    //   name: RouteName.landingPage,
    //   builder: (context, state) => LandingScreen(),
    // ),
  ],
);

//path class  "/name"
class RoutePath {
  static const String landingPage = "/landing_page";
}

//name class "name"
class RouteName {
  static const String landingPage = "landing_page";
}
