import 'package:flutter/material.dart';
import 'package:portfolio_website/views/mobile_view/mobile_view_layout.dart';
import 'package:portfolio_website/views/web_view/web_splash/web_splash_screen.dart';
import 'package:portfolio_website/widgets/layout/base_layout.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirza Mahmud - Portfolio',
      debugShowCheckedModeBanner: false,
      home: const BaseLayout(
        mobileLayout: MobileViewLayout(),
        tabletLayout: MobileViewLayout(),
        webLayout: WebSplashScreen(),
      ),
    );
  }
}
