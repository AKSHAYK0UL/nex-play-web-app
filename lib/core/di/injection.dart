import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:nex_play/core/constants/hive_const.dart';
import 'package:nex_play/core/network/dio_client.dart';
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
import 'package:nex_play/features/movie/data/remote/movie_api_service.dart';
import 'package:nex_play/features/movie/data/remote/movie_remote_datasource.dart';
import 'package:nex_play/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:nex_play/features/movie/domain/repositories/movie_repository.dart';
import 'package:nex_play/features/movie/domain/usecases/movie_detailed_usecase.dart';
import 'package:nex_play/features/movie/domain/usecases/now_playing_usecase.dart';
import 'package:nex_play/features/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_bloc.dart';
import 'package:nex_play/features/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_bloc.dart';

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

  //Movie API service
  sl.registerLazySingleton<MovieApiService>(() => MovieApiService(sl<Dio>()));

  //MOvie remote data source
  sl.registerLazySingleton<MovieRemoteDatasource>(
    () => MovieRemoteDatasourceImpl(sl<MovieApiService>()),
  );

  //Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl<MovieRemoteDatasource>()),
  );

  //usecases
  sl.registerLazySingleton<MovieDetailedUsecase>(
    () => MovieDetailedUsecase(sl<MovieRepository>()),
  );

  sl.registerLazySingleton<NowPlayingUsecase>(
    () => NowPlayingUsecase(sl<MovieRepository>()),
  );

  //Movie detailed bloc
  sl.registerLazySingleton<MovieDetailedBloc>(
    () => MovieDetailedBloc(movieDetailedUsecase: sl<MovieDetailedUsecase>()),
  );

  //Now playing bloc
  sl.registerLazySingleton<NowPlayMoviesBloc>(
    () => NowPlayMoviesBloc(nowPlayingUsecase: sl<NowPlayingUsecase>()),
  );
}
