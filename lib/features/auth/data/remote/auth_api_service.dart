import 'package:dio/dio.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/features/auth/data/models/req/forgotpassword_req.dart';
import 'package:nex_play/features/auth/data/models/req/resent_otp_req.dart';
import 'package:nex_play/features/auth/data/models/req/resetpassword_req.dart';
import 'package:nex_play/features/auth/data/models/req/signin_req.dart';
import 'package:nex_play/features/auth/data/models/req/signup_req.dart';
import 'package:nex_play/features/auth/data/models/req/verify_req.dart';
import 'package:nex_play/features/auth/data/models/res/forgotpassword_res.dart';
import 'package:nex_play/features/auth/data/models/res/resent_otp_res.dart';
import 'package:nex_play/features/auth/data/models/res/resetpassword_res.dart';
import 'package:nex_play/features/auth/data/models/res/signin_res.dart';
import 'package:nex_play/features/auth/data/models/res/signup_res.dart';
import 'package:nex_play/features/auth/data/models/res/verify_res.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  //SignUp
  @POST(AuthAPI.signUp)
  Future<SignupRes> signUp(@Body() SignUpReq body);

  //Verify
  @POST(AuthAPI.verify)
  Future<VerifyRes> verify(@Body() VerifyReq body);

  //SignIn
  @POST(AuthAPI.signIn)
  Future<SigninRes> signIn(@Body() SigninReq body);

   //Resent OTP
  @POST(AuthAPI.resentOTP)
  Future<ResentOTPRes> resentOTP(@Body() ResentOTPReq body);

  //forgot
  @POST(AuthAPI.forgotPassword)
  Future<ForgotpasswordRes> forgotPassword(@Body() ForgotPasswordReq body);

  //reset password
  @POST(AuthAPI.resetPassword)
  Future<ResetpasswordRes> resetPassword(@Body() ResetpasswordReq body);
}
