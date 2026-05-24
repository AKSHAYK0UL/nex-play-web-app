class ApiConst {
  //Timeout durations in seconds for network requests.
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;
  static const int otpCodeLenght = 6;

  static const String baseUrl = 'http://localhost:3000/api/v1';

  static const String signUp = '$baseUrl/auth/signup';
  static const String verify = '$baseUrl/auth/verify';

  static const String signIn = '$baseUrl/auth/signin';
  // static const String forgotPassword = '$baseUrl/auth/forgot';
}
