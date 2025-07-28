import 'package:shared_preferences/shared_preferences.dart';

class LocalCacheService {
  late SharedPreferences _prefs;
  static final LocalCacheService shared = LocalCacheService();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveData(String key, String value) {
    return _prefs.setString(key, value);
  }

  String? getData(String key) {
    return _prefs.getString(key);
  }

  // Future<bool> removeData(String key) async {
  //   return _prefs.remove(key);
  // }

  // bool saveJson(String key, dynamic json) {
  //   return false;
  // }

  // Future<bool> saveJson(String key, dynamic jsonObject) async {
  //   String jsonString = jsonEncode(jsonObject);
  //   return await LocalCacheService.shared.saveData(key, jsonString);
  // }

  // // Para ler e transformar de volta:
  // dynamic getJson(String key) {
  //   String? jsonString = LocalCacheService.shared.getData(key);
  //   if (jsonString == null) return null;
  //   return jsonDecode(jsonString);
  // }
}
