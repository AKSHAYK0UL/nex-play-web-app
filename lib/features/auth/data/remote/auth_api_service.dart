import 'package:dio/dio.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/features/auth/data/models/req/signin_req.dart';
import 'package:nex_play/features/auth/data/models/req/signup_req.dart';
import 'package:nex_play/features/auth/data/models/req/verify_req.dart';
import 'package:nex_play/features/auth/data/models/res/signin_res.dart';
import 'package:nex_play/features/auth/data/models/res/signup_res.dart';
import 'package:nex_play/features/auth/data/models/res/verify_res.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  //SignUp
  @POST(ApiConst.signUp)
  Future<SignupRes> signUp(@Body() SignUpReq body);

  //Verify
  @POST(ApiConst.verify)
  Future<VerifyRes> verify(@Body() VerifyReq body);

  //SignIn
  @POST(ApiConst.signIn)
  Future<SigninRes> signIn(@Body() SigninReq body);
}
