class Urls {
  static const bool Debug = true;
  static String getBaseURL() => Debug ? "http://127.0.0.1:8000/" : "https://api.tracery.us/";
  static String LOGIN_URL = getBaseURL() + "users/auth/token/login/";
  static String SIGNUP_URL = getBaseURL() + "users/auth/users/";
  static String USER_URL = getBaseURL() + "users/auth/users/me/";
  static String PASSWORD_RESET_URL = getBaseURL() + "users/password/reset/";
  static String CHECK_USERNAME = getBaseURL() + "users/username-available/";
}
