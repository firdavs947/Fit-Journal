import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/onboardiing_provider.dart';
import 'package:fitjournal/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class OnboardingPageviewbuilderWidget extends StatefulWidget {
  const OnboardingPageviewbuilderWidget({
    super.key,
    required this._pageController,
    required this.logoSize,
    required this.travelText,
  });
  final PageController _pageController;
  final Function travelText;
  final double logoSize;

  @override
  State<OnboardingPageviewbuilderWidget> createState() =>
      _OnboardingPageviewbuilderWidgetState();
}

class _OnboardingPageviewbuilderWidgetState
    extends State<OnboardingPageviewbuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget._pageController,
      itemCount: context.watch<OnboardiingProvider>().info.length,
      onPageChanged: context.read<OnboardiingProvider>().onPageChanged,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: LiquidGlassButton(
            style: LiquidGlassStyle(
              adaptivity: LiquidGlassAdaptivity(
                glassColorOnDark: Appcolors.whiteOpacity10,
                glassColorOnLight: Appcolors.whiteOpacity10,
                continuousGlassColor: true,
              ),
              liteGlass: LiquidGlassLitePickup.blend,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      context.watch<OnboardiingProvider>().currentPage == 0
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Шаг ${context.watch<OnboardiingProvider>().currentPage + 1} из ${context.watch<OnboardiingProvider>().info.length}',
                          style: TextStyle(color: Appcolors.lightGrey90),
                        ),
                        GestureDetector(
                          onTap: () => i == 0
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                )
                              : i == 1
                              ? widget._pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                )
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                ),
                          child: Text(
                            context.watch<OnboardiingProvider>().steps[i],
                            style: TextStyle(color: Appcolors.primary),
                          ),
                        ),
                      ],
                    ),
                    context.watch<OnboardiingProvider>().currentPage == 0
                        ? SizedBox(height: 45)
                        : SizedBox(),
                    context.watch<OnboardiingProvider>().currentPage == 0
                        ? SizedBox(height: widget.logoSize)
                        : SizedBox(),
                    context.watch<OnboardiingProvider>().currentPage == 0
                        ? SizedBox(height: 20)
                        : SizedBox(),
                    context.watch<OnboardiingProvider>().currentPage == 0
                        ? SizedBox()
                        : SizedBox(height: 10),
                    widget.travelText(
                      i: i,
                      child: Text(
                        context.watch<OnboardiingProvider>().info[i]['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.whiteOpacity90,
                        ),
                      ),
                    ),
                    context.watch<OnboardiingProvider>().currentPage == 0
                        ? SizedBox(height: 10)
                        : SizedBox(height: 5),
                    Padding(
                      padding:
                          context.watch<OnboardiingProvider>().currentPage == 0
                          ? EdgeInsetsGeometry.only(left: 40, right: 25)
                          : EdgeInsetsGeometry.zero,
                      child: widget.travelText(
                        i: i,
                        child: Text(
                          context
                              .watch<OnboardiingProvider>()
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
                    context.watch<OnboardiingProvider>().currentPage == 1
                        ? Wrap(
                            runSpacing: 15,
                            spacing: 15,
                            children: List.generate(
                              context.watch<OnboardiingProvider>().goal.length,
                              (i) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<OnboardiingProvider>()
                                        .onGoalChanged(i);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    height: 100,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            context
                                                    .read<OnboardiingProvider>()
                                                    .selectedGoal ==
                                                i
                                            ? Appcolors.selectedWrapIconColor
                                            : Appcolors.wrapColor,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      color:
                                          context
                                                  .read<OnboardiingProvider>()
                                                  .selectedGoal ==
                                              i
                                          ? Appcolors.selectedWrapColor
                                          : Appcolors.wrapColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsGeometry.only(
                                        right: 12,
                                        left: 12,
                                        top: 20,
                                      ),
                                      child: Column(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            context
                                                .watch<OnboardiingProvider>()
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
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          Text(
                                            context
                                                .watch<OnboardiingProvider>()
                                                .goal[i],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
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
                        : context.watch<OnboardiingProvider>().currentPage == 2
                        ? Column(
                            spacing: 13.5,
                            children: List.generate(
                              context
                                  .watch<OnboardiingProvider>()
                                  .experience
                                  .length,
                              (i) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<OnboardiingProvider>()
                                        .onTraininChanged(i);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    height: 62,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            context
                                                    .watch<
                                                      OnboardiingProvider
                                                    >()
                                                    .selectedTraining ==
                                                i
                                            ? Appcolors.selectedWrapIconColor
                                            : Appcolors.wrapColor,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                          context
                                                  .watch<OnboardiingProvider>()
                                                  .selectedTraining ==
                                              i
                                          ? Appcolors.selectedWrapColor
                                          : Appcolors.wrapColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsGeometry.only(
                                            top: 7.5,
                                            left: 15,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                      ? Appcolors
                                                            .selectedWrapIconColor
                                                      : Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                context
                                                    .watch<
                                                      OnboardiingProvider
                                                    >()
                                                    .experience2[i],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CupertinoCheckbox(
                                          fillColor:
                                              WidgetStateProperty.resolveWith<
                                                Color
                                              >((states) {
                                                if (states.contains(
                                                  WidgetState.selected,
                                                )) {
                                                  return Appcolors
                                                      .selectedWrapIconColor;
                                                }
                                                return Appcolors.wrapColor;
                                              }),
                                          checkColor: Appcolors.wrapColor,
                                          shape: CircleBorder(),
                                          value:
                                              context
                                                  .watch<OnboardiingProvider>()
                                                  .selectedTraining ==
                                              i,
                                          onChanged: (bool? newValue) {
                                            context
                                                .read<OnboardiingProvider>()
                                                .onTraininChanged(i);
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
    );
  }
}
