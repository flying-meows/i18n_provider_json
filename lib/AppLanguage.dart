import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* Creating AppLanguage() Provider to manage Locale */

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale ?? Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance(); 
    /* Exception has occurred.
FlutterError (ServicesBinding.defaultBinaryMessenger was accessed 
before the binding was initialized.
If you're running an application and need to access the binary messenger 
before `runApp()` has been called (for example, during plugin initialization), 
then you need to explicitly call the `WidgetsFlutterBinding.ensureInitialized()` first.
If you're running a test, you can call the `TestWidgetsFlutterBinding.ensureInitialized()` 
as the first line in your test's `main()` method to initialize the binding.) */
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }


  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ar")) {
      _appLocale = Locale("ar");
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}