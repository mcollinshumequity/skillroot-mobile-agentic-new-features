import 'package:flutter/material.dart';

import 'package:skillroot/tab_screen.dart';
import 'package:skillroot/pages/auth/login.dart';
import 'package:skillroot/pages/auth/register.dart';
import 'package:skillroot/pages/auth/two_factor.dart';
import 'package:skillroot/pages/splash.dart';

class Routes {
  static const String SPLASH = "/";
  static const String REGISTER = "/Auth/Register";
  static const String TWOFACTOR = "/Auth/TwoFactor";
  static const String LOGIN = "/Auth/Login";
  static const String HOME = "/Home/HomeScreen";

  static var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => const SplashScreen(),
    Routes.REGISTER: (BuildContext context) => RegisterScreen(),
    Routes.LOGIN: (BuildContext context) => LoginScreen(),
    Routes.TWOFACTOR: (BuildContext context) => TwoFactorScreen(),
    Routes.HOME: (BuildContext context) => TabScreen(),
  };
}
