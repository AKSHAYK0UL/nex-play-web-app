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
}
