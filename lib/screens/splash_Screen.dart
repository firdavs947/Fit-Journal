import 'package:animate_do/animate_do.dart';
import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/screens/main_screen.dart';
import 'package:fitjournal/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigator(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>GetStorage().read('opened') == null || GetStorage().read('opened') == false ? OnboardingScreen():MainScreen()),
    );
  }

  @override
  void initState() {
    navigator(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: Container(
        color: Appcolors.scaffoldBodyColor,
        width: double.infinity,
        child: Column(
          
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 131),
              child: ZoomIn(
                duration: Duration(milliseconds: 1000),
                child: Assets.images.logo.image()),
            ),
          ],
        ),
      ),
    );
  }
}
