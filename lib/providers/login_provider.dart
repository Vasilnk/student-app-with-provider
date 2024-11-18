import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? schoolId;
  String? password;
  String? schoolName;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schoolId = prefs.getString('schoolId');
    password = prefs.getString('password');
    schoolName = prefs.getString('schoolName');

    if (schoolId != null && password != null) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }

    notifyListeners();
  }

  Future<void> setLogin(String id, String pass, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('schoolId', id);
    await prefs.setString('password', pass);
    await prefs.setString('schoolName', name);
    schoolId = id;
    password = pass;
    _isLoggedIn = true;
    schoolName = name;
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear;
    schoolId = null;
    password = null;
    _isLoggedIn = false;

    notifyListeners();
  }
}
