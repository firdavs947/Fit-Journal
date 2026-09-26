import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/providers/onboardiing_provider.dart';
import 'package:fitjournal/widgets/onboarding_liquidglassbutton_widgeet.dart';
import 'package:fitjournal/widgets/onboarding_pageviewBuilder_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  static const double logoSize = 96;
  static const double gapAboveCard = 30;
  static const double outerZoneHeight = logoSize + gapAboveCard;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget travelText({required int i, required Widget child}) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, c) {
        double page = i.toDouble();
        if (_pageController.hasClients &&
            _pageController.position.haveDimensions) {
          page = _pageController.page ?? i.toDouble();
        }

        final double progress = (page - i).abs().clamp(0.0, 1.0);

        return Transform.translate(
          offset: Offset(0, -30 * progress),
          child: Opacity(opacity: (1 - progress).clamp(0.0, 1.0), child: c),
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.scaffoldBodyColor,
      body: ChangeNotifierProvider(
        create: (_) => OnboardiingProvider(),
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Spacer(),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: outerZoneHeight),
                        SizedBox(
                          height: 350,
                          child: OnboardingPageviewbuilderWidget(pageController: _pageController, logoSize: logoSize, travelText: travelText)
                        ),
                      ],
                    ),
                    AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double page = 0;
                        if (_pageController.hasClients &&
                            _pageController.position.haveDimensions) {
                          page = _pageController.page ?? 0;
                        }

                        final double progress = page.clamp(0.0, 1.0);

                        double topInside = outerZoneHeight + 16 + 24 + 45;
                        double topOutside = 0;

                        final double top =
                            topInside + (topOutside - topInside) * progress;

                        return Positioned(top: top, child: child!);
                      },
                      child: Container(
                        height: logoSize,
                        width: logoSize,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Appcolors.primary,
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: Appcolors.primaryGreenLogo,
                        ),
                        child: Assets.images.logo.image(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    context.watch<OnboardiingProvider>().info.length,
                    (i) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        width:
                            context
                                    .watch<OnboardiingProvider>()
                                    .currentPage ==
                                i
                            ? 30
                            : 12,
                        height: 12,
                        margin: EdgeInsetsGeometry.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:
                              context
                                      .watch<OnboardiingProvider>()
                                      .currentPage ==
                                  i
                              ? Appcolors.primary
                              : Appcolors.slateDark,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
              OnboardingLiquidglassbuttonWidgeet(pageController: _pageController)
               , Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}