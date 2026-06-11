class ApiConst {
  //Timeout durations in seconds for network requests.
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;
  static const int otpCodeLenght = 6;

  static const String baseUrl = 'http://localhost:8080/api/v1';

  static const String signUp = '$baseUrl/auth/signup';
  static const String verify = '$baseUrl/auth/verify';
  static const String signIn = '$baseUrl/auth/signin';
  static const String refreshToken = '$baseUrl/auth/refresh';
  static const String resentOTP = '$baseUrl/auth/otp/resend';
  static const String forgotPassword = '$baseUrl/auth/password/forgot';
  static const String resetPassword = '$baseUrl/auth/password/reset';

  // Movie
  static const String movieDetails = '$baseUrl/movie/details';
}
