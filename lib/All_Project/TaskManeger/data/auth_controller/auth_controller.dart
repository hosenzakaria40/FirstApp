import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthController {
  static String? token;
  static UserModel? userModel;

  static Future saveUserData(String Utoken, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', Utoken);
    sharedPreferences.setString('user_Model', jsonEncode(userModel.toString()));
    token = token;
    userModel = userModel;
  }

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tkn = sharedPreferences.getString('token');
    String? userModel = sharedPreferences.getString('user_Model');
    if (tkn != null) {
      token = tkn;
    }
    String? Udata = sharedPreferences.getString('user_Model');
    if (Udata != null) {
      userModel = Udata;
    }
  }

  static Future<bool> isUserLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tkn = sharedPreferences.getString('token');
    String? userModel = sharedPreferences.getString('userModel');
    return tkn != null;
    /*if (tkn != null) {
      return tkn;
    }else{
      return false;
    }*/
  }

  static Future logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    sharedPreferences.remove('user_Model');
    token = null;
    userModel = null;
  }
}
