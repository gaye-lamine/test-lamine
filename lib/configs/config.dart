class Config {
  static const String apiUrl = "http://10.0.2.2:8000";
  static const String apiUrlSeter = "https://api-hackathon.seter.sn/api";
  //android 10.0.2.2
  //127.0.0.1:8000/api/v1

  /* --------------    auth endpoints     --------------- */
  static const String authMobileApi = "/api/v1/code-auto";
  static const String authValidationCodeApi = "/api/v1/verify-otp";
  static const String authRegisterApi = "/api/v1/register";
  static const String getUser = "/api/v1/register/";

  /* ------------    Seter endpoint     --------------- */
  static const String allTrainsStation = "/gares";
}
