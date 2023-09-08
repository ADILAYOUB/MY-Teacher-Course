//create our singleton class of shared preference
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    // this is the single instance we are having
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // crate a global pointer to it => global.dart
}
