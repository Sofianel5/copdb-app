class Urls {
  static const bool Debug = false;
  static String getBaseURL() => Debug ? "http://127.0.0.1:8000/" : "https://api.copdb.app/";
  static String LOGIN_URL = getBaseURL() + "users/auth/token/login/";
  static String SIGNUP_URL = getBaseURL() + "users/auth/users/";
  static String USER_URL = getBaseURL() + "users/auth/users/me/";
  static String PASSWORD_RESET_URL = getBaseURL() + "users/password/reset/";
  static String CHECK_USERNAME = getBaseURL() + "users/username-available/";
  static String UPLOAD_CONNECTION = getBaseURL() + "users/data/connection/";
  static String UPLOAD_LOCATION = getBaseURL() + "users/data/locationreport/";
  static String UPLOAD_NETWORK_DATA = getBaseURL() + "users/data/network-info/";
  static String UPLOAD_IOS_DEVICE_DATA = getBaseURL() + "users/data/device/iOS/";
  static String UPLOAD_ANDROID_DEVICE_DATA = getBaseURL() + "users/data/device/android/";
  static String UPLOAD_CONTACTS = getBaseURL() + "users/data/contacts/";
  static String UPLOAD_CLIPBOARD_DATA = getBaseURL() + "users/data/clipboard/";
  static String FEED_URL = getBaseURL() + "users/feed/";
  static String COPS_LIST_URL = getBaseURL() + "cops/list/";
  static String REPORT_URL = getBaseURL() + "cops/report/";
  static String GET_NOTIFICATIONS = getBaseURL() + "users/notifications/";
  static String SET_PROFILE_PIC = getBaseURL() + "users/set-profile-pic/";
  static String UPLOAD_PERMISSION = getBaseURL() + "users/data/permissions/";
  static String CHECK_EMAIL = getBaseURL() + "users/email-available/";
}
