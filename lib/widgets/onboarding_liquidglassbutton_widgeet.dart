import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/onboardiing_provider.dart';
import 'package:fitjournal/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class OnboardingLiquidglassbuttonWidgeet extends StatefulWidget {
  const OnboardingLiquidglassbuttonWidgeet({super.key, required this._pageController});
  final PageController _pageController;
  @override
  State<OnboardingLiquidglassbuttonWidgeet> createState() =>
      _OnboardingLiquidglassbuttonWidgeetState();
}

class _OnboardingLiquidglassbuttonWidgeetState
    extends State<OnboardingLiquidglassbuttonWidgeet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: LiquidGlassButton(
        touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
        style: LiquidGlassStyle(
          adaptivity: LiquidGlassAdaptivity(
            glassColorOnDark: Appcolors.whiteOpacity10,
            glassColorOnLight: Appcolors.whiteOpacity10,
            continuousGlassColor: true,
          ),
          liteGlass: LiquidGlassLitePickup.blend,
        ),
        onPressed: () {
          context.read<OnboardiingProvider>().info.length - 1 ==
                  context.read<OnboardiingProvider>().currentPage
              ? Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => LoginScreen()),
                )
              :widget. _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
        },
        child: Center(
          child: Text(
            context.watch<OnboardiingProvider>().currentPage ==
                    context.watch<OnboardiingProvider>().info.length - 3
                ? context.watch<OnboardiingProvider>().steps2[0]
                : context.watch<OnboardiingProvider>().currentPage ==
                      context.watch<OnboardiingProvider>().info.length - 2
                ? context.watch<OnboardiingProvider>().steps2[1]
                : context.watch<OnboardiingProvider>().currentPage ==
                      context.watch<OnboardiingProvider>().info.length - 1
                ? context.watch<OnboardiingProvider>().steps2[2]
                : '',
            style: TextStyle(fontSize: 18, color: Appcolors.primary),
          ),
        ),
      ),
    );
  }
}
