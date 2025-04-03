import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/portfolio_app.dart';
import 'package:portfolio_website/service/firebase_service.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await FirebaseService.initialize();
  if (GetPlatform.isWeb) {
    setUrlStrategy(PathUrlStrategy());
  }

  runApp(const PortfolioApp());
}
