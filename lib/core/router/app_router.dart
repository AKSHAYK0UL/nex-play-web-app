import 'package:go_router/go_router.dart';
import 'package:nex_play/core/di/injection.dart';
import 'package:nex_play/features/auth/data/local/auth_local_datasource.dart';
import 'package:nex_play/features/auth/presentation/screens/auth_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/forgotpassword_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/landing_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/verify_screen.dart';
import 'package:nex_play/features/home/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  // initialLocation: RoutePath.landingPage,
    initialLocation: RoutePath.homeScreen,

  // redirect: (context, state) async {
  //   final hasTokens = await sl<AuthLocalDatasource>().hasTokens();
  //   if (hasTokens && state.matchedLocation == RoutePath.landingPage) {
  //     return RoutePath.homeScreen;
  //   }
  //   return null;
  // },
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
      path: RoutePath.forgotPassword,
      name: RouteName.forgotPassword,
      builder: (context, state) => const ForgotpasswordScreen(),
    ),
    GoRoute(
      path: RoutePath.verifyScreen,
      name: RouteName.verifyScreen,
      builder: (context, state) {
        final routeData = state.extra as Map<String, String>;
        final email = routeData['email'] as String;
        final password = routeData['password'] as String;
        return VerifyScreen(email: email, password: password);
      },
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
  static const String forgotPassword = "/forgot_password";
  static const String homeScreen = "/home_screen";
}

//name class "name"
class RouteName {
  static const String landingPage = "landing_page";
  static const String authScreen = "auth_screen";
  static const String verifyScreen = "verify_screen";
  static const String forgotPassword = "forgot_password";
  static const String homeScreen = "home_screen";
}
