import 'package:shared_preferences/shared_preferences.dart';
import 'Constants/constants.dart';

class SharedPref{
  setFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(alreadyUsed, true);
  }
  Future<bool> getFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool first = (prefs.getBool(alreadyUsed) ?? false);
    print("from file $first");
    return first;

  }
  setLoggedIn(bool log) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedIn, log);
  }
  Future<bool> getLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool first = (prefs.getBool(loggedIn) ?? false);
    return first;

  }

  setUserData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userData, data);
  }
  Future<String> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = (prefs.getString(userData) ?? "");
    return data;

  }

}