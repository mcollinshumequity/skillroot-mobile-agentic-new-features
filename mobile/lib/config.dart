import 'package:flutter/foundation.dart';

// API Configurations
// 10.0.2.2 is the special alias to your host loopback interface for Android emulators
// For Web or iOS simulators, use localhost (127.0.0.1)
String get _devHost => kIsWeb ? "localhost" : (defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost");
final String devApiUrl = "http://$_devHost:8080/v1/";

const String prodApiUrl = "https://api.skillroot.net/v1/"; // Placeholder for Production

// Toggle based on build mode
final String apiUrl = kReleaseMode ? prodApiUrl : devApiUrl;

const String apiKey = "f8e7db0c-7d2c-4102-8983-1b1de50ba309";
final String apiHost = apiUrl;
const String appName = "SkillROOT";

const bool useDrawerMenu = true;
