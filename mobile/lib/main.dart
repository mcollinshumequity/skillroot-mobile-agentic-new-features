// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/routes.dart';
import 'firebase_options.dart';
import 'config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index);
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1)).then(
      (value) => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
          statusBarBrightness: AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.grey,
          systemNavigationBarIconBrightness: AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
        ),
      ),
    );
    return GetMaterialApp(
      scrollBehavior: const ScrollBehavior(
        // ignore: deprecated_member_use
        // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
      ),
      title: appName,
      navigatorKey: NavKey.navKey,
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      // home: PageScreen(),
    );
  }
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}
