import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_website/portfolio_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const PortfolioApp());
}
