import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFFFF6584),
          tertiary: const Color(0xFF43CBFF),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFFFF6584),
          tertiary: const Color(0xFF43CBFF),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      themeMode: ThemeMode.system,
      home: const BaseLayout(
        mobileLayout: MobileViewLayout(),
        tabletLayout: MobileViewLayout(),
        webLayout: WebViewLayout(),
      ),
    );
  }
}