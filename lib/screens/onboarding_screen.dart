import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/providers/onboardiing_provider.dart';
import 'package:fitjournal/screens/home_screen.dart';
import 'package:fitjournal/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
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
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: context
                                .watch<OnboardiingProvider>()
                                .info
                                .length,
                            onPageChanged: context
                                .read<OnboardiingProvider>()
                                .onPageChanged,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
                                child: LiquidGlassButton(
                                  
                                    // touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
                                                   style: LiquidGlassStyle(
                                                     adaptivity: LiquidGlassAdaptivity(
                                                       glassColorOnDark: Appcolors.whiteOpacity10,
                                                       glassColorOnLight: Appcolors.whiteOpacity10,
                                                       continuousGlassColor: true,
                                                     ),
                                                     liteGlass: LiquidGlassLitePickup.blend,
                                                   ),
                                  child: Padding(
                                    padding: const EdgeInsetsGeometry.symmetric(
                                      // horizontal: 0,
                                      vertical: 16,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            context
                                                    .watch<
                                                      OnboardiingProvider
                                                    >()
                                                    .currentPage ==
                                                0
                                            ? CrossAxisAlignment.center
                                            : CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Шаг ${context.watch<OnboardiingProvider>().currentPage + 1} из ${context.watch<OnboardiingProvider>().info.length}',
                                                style: TextStyle(
                                                  color: Appcolors.lightGrey90,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () =>
                                                  i == 0?  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen(),
                                                      ),
                                                    ): i ==1? _pageController.previousPage(
                                                                  duration: Duration(milliseconds: 300),
                                                                  curve: Curves.easeInOut,
                                                            ): Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen(),
                                                      ),
                                                    ),
                                                child: Text(
                                                  context
                                                      .watch<
                                                        OnboardiingProvider
                                                      >()
                                                      .steps[i],
                                                  style: TextStyle(
                                                    color: Appcolors.primary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          context
                                                      .watch<
                                                        OnboardiingProvider
                                                      >()
                                                      .currentPage ==
                                                  0
                                              ? SizedBox(height: 45)
                                              : SizedBox(),
                                          context
                                                      .watch<
                                                        OnboardiingProvider
                                                      >()
                                                      .currentPage ==
                                                  0
                                              ? SizedBox(height: logoSize)
                                              : SizedBox(),
                                          context
                                                      .watch<
                                                        OnboardiingProvider
                                                      >()
                                                      .currentPage ==
                                                  0
                                              ? SizedBox(height: 20)
                                              : SizedBox(),
                                          context
                                                      .watch<
                                                        OnboardiingProvider
                                                      >()
                                                      .currentPage ==
                                                  0
                                              ? SizedBox()
                                              : SizedBox(height: 10),
                                          travelText(
                                            i: i,
                                            child: Text(
                                              context
                                                  .watch<OnboardiingProvider>()
                                                  .info[i]['title'],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Appcolors.whiteOpacity90,
                                              ),
                                            ),
                                          ),
                                            
                                          context
                                                      .watch<
                                                        OnboardiingProvider
                                                      >()
                                                      .currentPage ==
                                                  0
                                              ? SizedBox(height: 10)
                                              : SizedBox(height: 5),
                                            
                                          Padding(
                                            padding:
                                                context
                                                        .watch<
                                                          OnboardiingProvider
                                                        >()
                                                        .currentPage ==
                                                    0
                                                ? EdgeInsetsGeometry.only(
                                                    left: 40,
                                                    right: 25,
                                                  )
                                                : EdgeInsetsGeometry.zero,
                                            child: travelText(
                                              i: i,
                                              child: Text(
                                                context
                                                    .watch<
                                                      OnboardiingProvider
                                                    >()
                                                    .info[i]['description'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Appcolors.lightGrey90,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          context
                                                      .watch<
                                                        OnboardiingProvider
                                                      >()
                                                      .currentPage ==
                                                  1
                                              ? Wrap(
                                                  runSpacing: 15,
                                                  spacing: 15,
                                                  children: List.generate(
                                                    context
                                                        .watch<
                                                          OnboardiingProvider
                                                        >()
                                                        .goal
                                                        .length,
                                                    (i) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                OnboardiingProvider
                                                              >()
                                                              .onGoalChanged(i);
                                                        },
                                                        child: AnimatedContainer(
                                                          duration: Duration(
                                                            milliseconds: 250,
                                                          ),
                                            
                                                          height: 100,
                                                          width: 170,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  context
                                                                          .read<
                                                                            OnboardiingProvider
                                                                          >()
                                                                          .selectedGoal ==
                                                                      i
                                                                  ? Appcolors
                                                                        .selectedWrapIconColor
                                                                  : Appcolors
                                                                        .wrapColor,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  30,
                                                                ),
                                                            color:
                                                                context
                                                                        .read<
                                                                          OnboardiingProvider
                                                                        >()
                                                                        .selectedGoal ==
                                                                    i
                                                                ? Appcolors
                                                                      .selectedWrapColor
                                                                : Appcolors
                                                                      .wrapColor,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsGeometry.only(
                                                                  right: 12,
                                                                  left: 12,
                                                                  top: 20,
                                                                ),
                                                            child: Column(
                                                              spacing: 10,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SvgPicture.asset(
                                                                  context
                                                                      .watch<
                                                                        OnboardiingProvider
                                                                      >()
                                                                      .icons[i],
                                                                  colorFilter: ColorFilter.mode(
                                                                    context
                                                                                .read<
                                                                                  OnboardiingProvider
                                                                                >()
                                                                                .selectedGoal ==
                                                                            i
                                                                        ? Appcolors
                                                                              .selectedWrapIconColor
                                                                        : Appcolors
                                                                              .unSelectedWrapIconColor,
                                                                    BlendMode
                                                                        .srcIn,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  context
                                                                      .watch<
                                                                        OnboardiingProvider
                                                                      >()
                                                                      .goal[i],
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        context
                                                                                .read<
                                                                                  OnboardiingProvider
                                                                                >()
                                                                                .selectedGoal ==
                                                                            i
                                                                        ? Appcolors
                                                                              .selectedWrapIconColor
                                                                        : Appcolors
                                                                              .unselectedWrapTextColor,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              : context
                                                        .watch<
                                                          OnboardiingProvider
                                                        >()
                                                        .currentPage ==
                                                    2
                                              ? Column(
                                                  spacing: 13.5,
                                                  children: List.generate(
                                                    context
                                                        .watch<
                                                          OnboardiingProvider
                                                        >()
                                                        .experience
                                                        .length,
                                                    (i) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                OnboardiingProvider
                                                              >()
                                                              .onTraininChanged(
                                                                i,
                                                              );
                                                        },
                                                        child: AnimatedContainer(
                                                          duration: Duration(
                                                            milliseconds: 250,
                                                          ),
                                                          height: 62,
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  context
                                                                          .watch<
                                                                            OnboardiingProvider
                                                                          >()
                                                                          .selectedTraining ==
                                                                      i
                                                                  ? Appcolors
                                                                        .selectedWrapIconColor
                                                                  : Appcolors
                                                                        .wrapColor,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  15,
                                                                ),
                                                            color:
                                                                context
                                                                        .watch<
                                                                          OnboardiingProvider
                                                                        >()
                                                                        .selectedTraining ==
                                                                    i
                                                                ? Appcolors
                                                                      .selectedWrapColor
                                                                : Appcolors
                                                                      .wrapColor,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsGeometry.only(
                                                                      top: 7.5,
                                                                      left: 15,
                                                                    ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  spacing: 2.5,
                                                                  children: [
                                                                    Text(
                                                                      context
                                                                          .watch<
                                                                            OnboardiingProvider
                                                                          >()
                                                                          .experience[i],
                                                                      style: TextStyle(
                                                                        color:
                                                                            context
                                                                                    .watch<
                                                                                      OnboardiingProvider
                                                                                    >()
                                                                                    .selectedTraining ==
                                                                                i
                                                                            ? Appcolors.selectedWrapIconColor
                                                                            : Colors.white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      context
                                                                          .watch<
                                                                            OnboardiingProvider
                                                                          >()
                                                                          .experience2[i],
                                                                      style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              CupertinoCheckbox(
                                                                fillColor: WidgetStateProperty.resolveWith<Color>((
                                                                  states,
                                                                ) {
                                                                  if (states.contains(
                                                                    WidgetState
                                                                        .selected,
                                                                  )) {
                                                                    return Appcolors
                                                                        .selectedWrapIconColor;
                                                                  }
                                                                  return Appcolors
                                                                      .wrapColor;
                                                                }),
                                                                checkColor:
                                                                    Appcolors
                                                                        .wrapColor,
                                                                shape:
                                                                    CircleBorder(),
                                                                value:
                                                                    context
                                                                        .watch<
                                                                          OnboardiingProvider
                                                                        >()
                                                                        .selectedTraining ==
                                                                    i,
                                                                onChanged:
                                                                    (
                                                                      bool?
                                                                      newValue,
                                                                    ) {
                                                                      context
                                                                          .read<
                                                                            OnboardiingProvider
                                                                          >()
                                                                          .onTraininChanged(
                                                                            i,
                                                                          );
                                                                    },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
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
                        margin: const EdgeInsetsGeometry.symmetric(horizontal: 4),
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
            
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 30),
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
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            )
                          : _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                    },
                    child: Center(
                      child: Text(
                        context.watch<OnboardiingProvider>().currentPage ==
                                context
                                        .watch<OnboardiingProvider>()
                                        .info
                                        .length -
                                    3
                            ? context.watch<OnboardiingProvider>().steps2[0]
                            : context
                                      .watch<OnboardiingProvider>()
                                      .currentPage ==
                                  context
                                          .watch<OnboardiingProvider>()
                                          .info
                                          .length -
                                      2
                            ? context.watch<OnboardiingProvider>().steps2[1]
                            : context
                                      .watch<OnboardiingProvider>()
                                      .currentPage ==
                                  context
                                          .watch<OnboardiingProvider>()
                                          .info
                                          .length -
                                      1
                            ? context.watch<OnboardiingProvider>().steps2[2]
                            : '',
                        style: TextStyle(
                          fontSize: 18,
                          color: Appcolors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
