import 'package:shared_preferences/shared_preferences.dart';

class NewPrefService {
  static SharedPreferences? _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  //store
  static Future<void> setData(StorageKey key, Object value) async {
    switch(key) {
      case StorageKey.mode: {
        await _pref!.setBool(StorageKey.mode.name, value as bool);
      } break;
      case StorageKey.lang: {
        await _pref!.setString(StorageKey.lang.name, value as String);
      } break;
    }
  }

  // read
  static Object? readData(StorageKey key) {
    return _pref!.get(key.name);
  }

  // remove
  static Future<void> removeData(StorageKey key) async {
    await _pref!.remove(key.name);
  }
}

enum StorageKey {
  mode,
  lang,
}