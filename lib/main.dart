import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nex_play/core/di/injection.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await Hive.initFlutter();

  await initDependencies();
  await initAppRouter();

  runApp(const NexPlay());
}

class NexPlay extends StatelessWidget {
  const NexPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<MovieDetailedBloc>()),
        BlocProvider(
          create: (_) => sl<NowPlayMoviesBloc>()
            ..add(
              const NowPlayMoviesEvent.getNowPlaying(lang: 'en-US', page: 1),
            ),
        ),
        BlocProvider(
          create: (_) => sl<TrendingMoviesBloc>()
            ..add(
              const TrendingMoviesEvent.getTrending(
                lang: 'en-US',
                page: 1,
                timeWindow: TimeWindow.week,
              ),
            ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Nex Play',

        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
