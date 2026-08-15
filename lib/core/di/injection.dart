import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:nex_play/core/cache/cache_service_impl/movie_cache/movie_cache_key.dart';
import 'package:nex_play/core/cache/cache_service_impl/movie_cache/movie_cache_service.dart';
import 'package:nex_play/core/cache/cache_service_interface/cache_service_interface.dart';
import 'package:nex_play/core/constants/hive_const.dart';
import 'package:nex_play/core/network/dio_client.dart';
import 'package:nex_play/core/paged_result/paged.dart';
import 'package:nex_play/features/auth/data/local/auth_local_datasource.dart';
import 'package:nex_play/features/auth/data/remote/auth_api_service.dart';
import 'package:nex_play/features/auth/data/remote/auth_remote_datasource.dart';
import 'package:nex_play/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';
import 'package:nex_play/features/auth/domain/usecases/forgotpassword_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/logout_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/resent_otp_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/resetpassword_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/signin_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/signup_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/verify_usecase.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nex_play/features/shared/movie/data/models/movie.dart';
import 'package:nex_play/features/shared/movie/data/remote/movie_api_service.dart';
import 'package:nex_play/features/shared/movie/data/remote/movie_remote_datasource.dart';
import 'package:nex_play/features/shared/movie/data/repositories/movie_repository_impl.dart';
import 'package:nex_play/features/shared/movie/domain/repositories/movie_repository.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/movie_detailed_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/now_playing_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/recommendations_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/similar_movie_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/toprated_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/trending_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/upcoming_usecase.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/upcoming_movies_bloc/upcoming_movies_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  //Hive box for auth storage
  final authBox = await Hive.openBox<String?>(HiveConst.authBox);
  sl.registerSingleton<Box<String?>>(authBox, instanceName: 'authBox');

  //LOCAL DATA SOURCE
  sl.registerLazySingleton<AuthLocalDatasource>(
    () =>
        AuthLocalDatasourceImpl(sl.get<Box<String?>>(instanceName: 'authBox')),
  );

  //Get tokens
  final authTokens = await sl<AuthLocalDatasource>().getTokens();

  // NETWORK (Dio + Retrofit)
  sl.registerLazySingleton<Dio>(
    () => createDio(
      token: authTokens?.token,
      localDatasource: sl<AuthLocalDatasource>(),
    ),
  );
  sl.registerLazySingleton<AuthApiService>(() => AuthApiService(sl<Dio>()));

  //REMOTE DATA SOURCE
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl<AuthApiService>()),
  );

  //REPOSITORY
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDatasource>(),
      localDataSource: sl<AuthLocalDatasource>(),
    ),
  );

  //usecases
  sl.registerLazySingleton<SignupUsecase>(
    () => SignupUsecase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<VerifyUsecase>(
    () => VerifyUsecase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<SigninUsecase>(
    () => SigninUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ResentOtpUsecase>(
    () => ResentOtpUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ForgotpasswordUsecase>(
    () => ForgotpasswordUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ResetpasswordUsecase>(
    () => ResetpasswordUsecase(sl<AuthRepository>()),
  );

  //Auth BloC
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      signUpUseCase: sl<SignupUsecase>(),
      verifyOtpUseCase: sl<VerifyUsecase>(),
      signInUseCase: sl<SigninUsecase>(),
      resentOtpUsecase: sl<ResentOtpUsecase>(),
      forgotpasswordUsecase: sl<ForgotpasswordUsecase>(),
      resetpasswordUsecase: sl<ResetpasswordUsecase>(),
      logoutUseCase: sl<LogoutUsecase>(),
    ),
  );

  //---------------------MOvie DI---------------------

  //cache

  sl.registerLazySingleton<CacheServiceInterface<MovieCacheKey, Paged<Movie>>>(
    () => MovieCacheService<MovieCacheKey, Paged<Movie>>(),
  );

  //Movie API service
  sl.registerLazySingleton<MovieApiService>(() => MovieApiService(sl<Dio>()));

  //MOvie remote data source
  sl.registerLazySingleton<MovieRemoteDatasource>(
    () => MovieRemoteDatasourceImpl(sl<MovieApiService>()),
  );

  //Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      sl<MovieRemoteDatasource>(),
      sl<CacheServiceInterface<MovieCacheKey, Paged<Movie>>>(),
    ),
  );

  //usecases
  sl.registerLazySingleton<MovieDetailedUsecase>(
    () => MovieDetailedUsecase(sl<MovieRepository>()),
  );

  sl.registerLazySingleton<NowPlayingUsecase>(
    () => NowPlayingUsecase(sl<MovieRepository>()),
  );

  sl.registerLazySingleton<TrendingUsecase>(
    () => TrendingUsecase(sl<MovieRepository>()),
  );

  sl.registerLazySingleton<RecommendationsUsecase>(
    () => RecommendationsUsecase(sl<MovieRepository>()),
  );

  sl.registerLazySingleton<SimilarMovieUsecase>(
    () => SimilarMovieUsecase(sl<MovieRepository>()),
  );

  sl.registerLazySingleton<UpcomingUsecase>(
    () => UpcomingUsecase(sl<MovieRepository>()),
  );

  sl.registerLazySingleton<TopratedUsecase>(
    () => TopratedUsecase(sl<MovieRepository>()),
  );

  //Movie detailed bloc
  sl.registerFactory<MovieDetailedBloc>(
    () => MovieDetailedBloc(movieDetailedUsecase: sl<MovieDetailedUsecase>()),
  );

  //Now playing bloc
  sl.registerLazySingleton<NowPlayMoviesBloc>(
    () => NowPlayMoviesBloc(nowPlayingUsecase: sl<NowPlayingUsecase>()),
  );

  //trending movies bloc
  sl.registerFactory<TrendingMoviesBloc>(
    () => TrendingMoviesBloc(trendingUsecase: sl<TrendingUsecase>()),
  );

  //recommendation movies bloc
  sl.registerFactory<MovieRecommendationsBloc>(
    () => MovieRecommendationsBloc(
      recommendationsUsecase: sl<RecommendationsUsecase>(),
    ),
  );

  //similar movies bloc
  sl.registerFactory<SimilarMoviesBloc>(
    () => SimilarMoviesBloc(similarMovieUsecase: sl<SimilarMovieUsecase>()),
  );

  //upcoming movies bloc
  sl.registerLazySingleton<UpcomingMoviesBloc>(
    () => UpcomingMoviesBloc(upcomingUsecase: sl<UpcomingUsecase>()),
  );

  //top rated movies

  sl.registerFactory<TopRatedMoviesBloc>(
    () => TopRatedMoviesBloc(topratedUsecase: sl<TopratedUsecase>()),
  );
}
