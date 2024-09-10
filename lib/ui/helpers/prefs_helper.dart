import 'package:expedientes/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperPrefs  {
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
  }

  static void setUser(UserModel user) {
    idUser = user.id;
    isAdmin = user.isAdmin;
    addressUser = user.address;
    emailUser = user.email;
    curpUser = user.curp ?? '';
    nameUser = user.name;
    lastNameUser = user.lastName;
    phoneUser = user.phone;
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

  // User Atributes

  static String get idUser {
    return _prefs.getString("id_user") ?? '';
  }

  static set idUser(String value) {
    _prefs.setString("id_user", value);
  }

  static bool get isAdmin {
    return _prefs.getBool("is_admin") ?? false;
  }

  static set isAdmin(bool value) {
    _prefs.setBool("is_admin", value);
  }

  static String get addressUser {
    return _prefs.getString("address_user") ?? '';
  }

  static set addressUser(String value) {
    _prefs.setString("address_user", value);
  }

  static String get emailUser {
    return _prefs.getString("email_user") ?? '';
  }

  static set emailUser(String value) {
    _prefs.setString("email_user", value);
  }

  static String get curpUser {
    return _prefs.getString("curp_user") ?? '';
  }

  static set curpUser(String value) {
    _prefs.setString("curp_user", value);
  }

  static String get nameUser {
    return _prefs.getString("name_user") ?? '';
  }

  static set nameUser(String value) {
    _prefs.setString("name_user", value);
  }

  static String get lastNameUser {
    return _prefs.getString("last_name_user") ?? '';
  }

  static set lastNameUser(String value) {
    _prefs.setString("last_name_user", value);
  }

  static String get phoneUser {
    return _prefs.getString("phone_user") ?? '';
  }

  static set phoneUser(String value) {
    _prefs.setString("phone_user", value);
  }
}
