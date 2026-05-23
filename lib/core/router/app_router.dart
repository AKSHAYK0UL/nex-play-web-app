import 'package:go_router/go_router.dart';
import 'package:nex_play/features/auth/presentation/screens/auth_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/landing_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/verify_screen.dart';
import 'package:nex_play/features/home/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: RoutePath.landingPage,
  routes: [
    GoRoute(
      path: RoutePath.landingPage,
      name: RouteName.landingPage,
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
      path: RoutePath.authScreen,
      name: RouteName.authScreen,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: RoutePath.verifyScreen,
      name: RouteName.verifyScreen,
      builder: (context, state) => VerifyScreen(email: state.extra as String),
    ),
    GoRoute(
      path: RoutePath.homeScreen,
      name: RouteName.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

//path class  "/name"
class RoutePath {
  static const String landingPage = "/landing_page";
  static const String authScreen = "/auth_screen";
  static const String verifyScreen = "/verify_screen";
  static const String homeScreen = "/home_screen";
}

//name class "name"
class RouteName {
  static const String landingPage = "landing_page";
  static const String authScreen = "auth_screen";
  static const String verifyScreen = "verify_screen";
  static const String homeScreen = "home_screen";
}
