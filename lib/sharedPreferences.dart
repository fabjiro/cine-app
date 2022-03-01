import 'package:shared_preferences/shared_preferences.dart';

class PreferenceShared {
  static SharedPreferences? pref;

  Future<void> initPref() async {
    pref = await SharedPreferences.getInstance();
  }
}
