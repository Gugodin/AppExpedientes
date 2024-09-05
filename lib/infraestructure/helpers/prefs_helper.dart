import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperPrefs extends ChangeNotifier {
  static final HelperPrefs _instancia = HelperPrefs._internal();

  factory HelperPrefs() {
    return _instancia;
  }
  HelperPrefs._internal();

  static late SharedPreferences _prefs;

  static Future initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future clearPrefs() async {
    await _prefs.clear();
    _instancia.notifyListeners();
  }

    static bool get isFirtsTime {
    return _prefs.getBool('is_firts_time') ?? true;
  }

  static set isFirtsTime(bool value) {
    _prefs.setBool('is_firts_time', value);
  }

  static String get registrationRequest {
    return _prefs.getString('id_registration_request') ?? '';
  }

  static set registrationRequest(String value) {
    _prefs.setString('id_registration_request', value);
  }

  static String get idUser {
    return _prefs.getString("id_user") ?? '';
  }

  static set idUser(String value) {
    _prefs.setString("id_user", value);
  }
}
