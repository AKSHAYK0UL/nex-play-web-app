import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/di/injection.dart';
import 'package:nex_play/features/auth/data/local/auth_local_datasource.dart';
import 'package:nex_play/features/auth/presentation/screens/auth_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/forgotpassword_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/landing_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/verify_screen.dart';
import 'package:nex_play/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/screens/movie_details_screen.dart';
import 'package:nex_play/features/shared/stream/stream_screen.dart';
import 'package:nex_play/features/shared/widgets/grid_movies_list.dart';
import 'package:nex_play/core/enums/grid_movie_type.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_event.dart';
import 'package:nex_play/core/enums/time_window.dart';

late final GoRouter appRouter;

Movie? _cachedMovieFallback; //cache route on the web

Future<void> initAppRouter() async {
  final hasTokens = await sl<AuthLocalDatasource>().hasTokens();
  final initialLocation = hasTokens
      ? RoutePath.bottomNavbar
      : RoutePath.landingPage;

  appRouter = GoRouter(
    initialLocation: initialLocation,
    redirect: (context, state) async {
      final loggedIn = await sl<AuthLocalDatasource>().hasTokens();
      final onLanding = state.matchedLocation == RoutePath.landingPage;
      if (loggedIn && onLanding) return RoutePath.bottomNavbar;
      if (!loggedIn && _protectedRoutes.contains(state.matchedLocation)) {
        return RoutePath.landingPage;
      }
      return null;
    },
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
        path: RoutePath.bottomNavbar,
        name: RouteName.bottomNavbar,
        builder: (context, state) => const BottomNavBar(),
      ),

      // GoRoute(
      //   path: RoutePath.movieDetailsScreen,
      //   name: RouteName.movieDetailsScreen,
      //   builder: (context, state) {
      //     final movie = state.extra as Movie;
      //     return MultiBlocProvider(
      //       providers: [
      //         BlocProvider(create: (_) => sl<MovieDetailedBloc>()),
      //         BlocProvider(create: (_) => sl<MovieRecommendationsBloc>()),
      //       ],

      //       child: MovieDetailScreen(movie: movie),
      //     );
      //   },
      // ),
      GoRoute(
        path: RoutePath.movieDetailsScreen,
        name: RouteName.movieDetailsScreen,
        builder: (context, state) {
          // Safely try to cast the extra data
          Movie? movie = state.extra as Movie?;

          //  Use kIsWeb
          if (kIsWeb) {
            //  WEB CACHE
            if (movie != null) {
              // Navigated normally from inside the app save to cache
              _cachedMovieFallback = movie;
            } else if (_cachedMovieFallback != null) {
              // extra is null (browser back button) pull from cache
              movie = _cachedMovieFallback;
            } else {
              // Both are null (user refreshed the page / hard reload)
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Movie data lost. Please return home.'),
                      TextButton(
                        onPressed: () {
                          context.go(RoutePath.bottomNavbar);
                        },
                        child: const Text('Home'),
                      ),
                    ],
                  ),
                ),
              );
            }
          } else {
            // MOBILE LOGIC
            if (movie == null) {
              return const Scaffold(
                body: Center(child: Text('Error: No movie data provided.')),
              );
            }
          }

          // Return your MultiBlocProvider as normal.

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<MovieDetailedBloc>()),
              BlocProvider(create: (_) => sl<MovieRecommendationsBloc>()),
              BlocProvider(create: (_) => sl<SimilarMoviesBloc>()),
            ],
            child: MovieDetailScreen(movie: movie!),
          );
        },
      ),
      GoRoute(
        path: RoutePath.streamScreen,
        name: RouteName.streamScreen,
        builder: (context, state) {
          final streamUrl = state.extra as String? ?? '';
          return StreamScreen(streamUrl: streamUrl);
        },
      ),
      GoRoute(
        path: RoutePath.gridMoviesScreen,
        name: RouteName.gridMoviesScreen,
        builder: (context, state) {
          final params = state.extra as GridMoviesParams;
          return GridMoviesScreen(params: params);
        },
      ),
    ],
  );
}

const _protectedRoutes = {
  RoutePath.bottomNavbar,
  RoutePath.movieDetailsScreen,
  RoutePath.streamScreen,
  RoutePath.gridMoviesScreen,
};

// path class "/name"
class RoutePath {
  static const String landingPage = "/landing_page";
  static const String authScreen = "/auth_screen";
  static const String verifyScreen = "/verify_screen";
  static const String forgotPassword = "/forgot_password";
  static const String bottomNavbar = "/bottom_nav_bar";
  static const String homeScreen = "/home_screen";
  static const String movieDetailsScreen = "/movie_details_screen";
  static const String streamScreen = "/stream_screen";
  static const String gridMoviesScreen = "/grid_movies_screen";
}

// name class "name"
class RouteName {
  static const String landingPage = "landing_page";
  static const String authScreen = "auth_screen";
  static const String verifyScreen = "verify_screen";
  static const String forgotPassword = "forgot_password";
  static const String bottomNavbar = "bottom_nav_bar";
  static const String homeScreen = "home_screen";
  static const String movieDetailsScreen = "movie_details_screen";
  static const String streamScreen = "stream_screen";
  static const String gridMoviesScreen = "grid_movies_screen";
}
