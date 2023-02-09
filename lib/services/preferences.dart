import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceFunctions {
  final String emailSharedPreference = "userEmail";
  final String userLoggedInSharedPreference = "ISLOGGEDIN";
  final String isGoogleLoggedInSharedPreference = "ISGOOGLELOGGEDIN";

  isUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res =
        sharedPreferences.setBool(userLoggedInSharedPreference, isLoggedIn);
    return res;
  }

  isGoogleLoggedIn(bool isGoogle) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res =
        sharedPreferences.setBool(isGoogleLoggedInSharedPreference, isGoogle);
    return res;
  }

  saveUserEmail(String userEmailId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = sharedPreferences.setString(emailSharedPreference, userEmailId);
    return res;
  }

  getUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = sharedPreferences.getBool(userLoggedInSharedPreference);
    return res;
  }

  getUserGoogleLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = sharedPreferences.getBool(isGoogleLoggedInSharedPreference);
    return res;
  }

  getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = sharedPreferences.getString(emailSharedPreference);
    return res;
  }

  SignOutSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = sharedPreferences.remove(emailSharedPreference);
    return res;
  }
}
