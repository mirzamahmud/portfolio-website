import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_website/portfolio_app.dart';
import 'package:portfolio_website/service/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await FirebaseService.initialize();
  runApp(const PortfolioApp());
}
