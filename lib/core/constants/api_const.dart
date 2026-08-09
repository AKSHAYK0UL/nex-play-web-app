import 'package:nex_play/core/config/secrets.dart';

class AuthAPI {
    // static const String baseUrl = 'http://localhost:8080/api/v1';
  static const String baseUrl = authBaseURL;
  //Timeout durations in seconds for network requests.
  // static const int connectTimeout = 30;
  // static const int receiveTimeout = 30;
  static const int connectTimeout = 60;
  static const int receiveTimeout = 60;
  static const int otpCodeLenght = 6;

  static const String signUp = '$baseUrl/auth/signup';
  static const String verify = '$baseUrl/auth/verify';
  static const String signIn = '$baseUrl/auth/signin';
  static const String refreshToken = '$baseUrl/auth/refresh';
  static const String resentOTP = '$baseUrl/auth/otp/resend';
  static const String forgotPassword = '$baseUrl/auth/password/forgot';
  static const String resetPassword = '$baseUrl/auth/password/reset';
}

// media endpoints
class MediaAPI {
  // static const String baseUrl = 'http://localhost:8080/api/v1';
    static const String baseUrl = mediaBaseURL;



  static const String movieDetails = '$baseUrl/movie/details';
  static const String nowPlaying = '$baseUrl/movie/now_playing';
  static const String trending = '$baseUrl/movie/trending';
  static const String upcoming = '$baseUrl/movie/upcoming';
  static const String popular = '$baseUrl/movie/popular';
  static const String topRated = '$baseUrl/movie/top_rated';
  static const String similar = '$baseUrl/movie/similar';
  static const String recommendations = '$baseUrl/movie/recommendations';
}
