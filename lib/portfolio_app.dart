import 'package:flutter/material.dart';
import 'package:portfolio_website/views/mobile_view/mobile_view_layout.dart';
import 'package:portfolio_website/views/web_view/web_view_layout.dart';
import 'package:portfolio_website/widgets/layout/base_layout.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirza Mahmud - Portfolio',
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      home: const BaseLayout(
        mobileLayout: MobileViewLayout(),
        tabletLayout: MobileViewLayout(),
        webLayout: WebViewLayout(),
      ),
    );
  }
}