import 'package:shared_preferences/shared_preferences.dart';

class SharedCheckHelper {
  static SharedPreferences? _prefs;
  static const String isLogin = 'isLogin';
  static const String userId = 'userId';
  static const String userName = 'userName';
  static const String userEmail = 'userEmail';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setLogin(bool value) async {
    await _prefs?.setBool(isLogin, value);
  }

  static Future<bool> getLogin() async {
    return _prefs?.getBool(isLogin) ?? false;
  }

  static Future<void> setUserData({
    required String id,
    required String name,
    required String email,
  }) async {
    await _prefs?.setString(userId, id);
    await _prefs?.setString(userName, name);
    await _prefs?.setString(userEmail, email);
  }

  static Future<Map<String, String?>> getUserData() async {
    return {
      'id': _prefs?.getString(userId),
      'name': _prefs?.getString(userName),
      'email': _prefs?.getString(userEmail),
    };
  }
}
