import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPreferences;

  static Future setData({String name, String phoneNumber}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool('hasData', true);
    _sharedPreferences.setString('name', name);
    _sharedPreferences.setString('phone', phoneNumber);
  }

  static Future getData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (_sharedPreferences.getBool('hasData') ?? false) {
      String name = _sharedPreferences.getString('name');
      String phoneNumber = _sharedPreferences.getString('phone');
      return [name, phoneNumber];
    }
    return false;
  }

//  static clearData() async {
//    _sharedPreferences = await SharedPreferences.getInstance();
//    _sharedPreferences.clear();
//  }
}
