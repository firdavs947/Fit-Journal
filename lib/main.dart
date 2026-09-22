import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fitjournal/const/themes/appThemes.dart';
import 'package:fitjournal/screens/home_screen.dart';
import 'package:fitjournal/screens/login_screen.dart';
import 'package:fitjournal/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: Appthemes.lightTheme(),
      dark: Appthemes.darkTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fit Journal',
        theme: light,
        darkTheme: dark,
        home: OnboardingScreen(),
      ),
    );
  }
}
