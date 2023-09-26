//create our singleton class of shared preference
import 'package:myteacher/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    // this is the single instance we are having
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // crate a global pointer to it => global.dart

  // share pref
  // here we will create a shared pref method which sets the value for the key
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }
  // we will use this one to set the value for the key but where should we set
  // the value => it will be in the welcome.dart file
  // on getstared when navigate to the home screen

  // we need to set up
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // how to read the value is true when login in first time
  // as we pass true when login in first time
  // we will create a method to know the value after setting it and then will be
  // able to use it
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> logoOut(String key) async {
    return await _prefs.remove(key);
  }
}
