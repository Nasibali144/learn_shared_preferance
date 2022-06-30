import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  // store
  static Future<void> setMode(bool isDark) async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool("mode", isDark);
  }

  // read
  static Future<bool> getMode() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getBool("mode") ?? false;
  }

  // delete
  static Future<bool> deleteMode() async {
    var pref = await SharedPreferences.getInstance();
    return pref.remove("mode");
  }
}


