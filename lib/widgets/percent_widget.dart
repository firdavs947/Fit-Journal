import 'dart:math';

import 'package:fitjournal/const/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PercentWidget extends StatefulWidget {
  const PercentWidget({super.key});

  @override
  State<PercentWidget> createState() => _PercentWidgetState();
}

class _PercentWidgetState extends State<PercentWidget> {
  late final double _percentValue;

  @override
  void initState() {
    super.initState();
    _percentValue = 40 + Random().nextInt(61).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Appcolors.whiteOpacity30),
            right: BorderSide(color: Appcolors.whiteOpacity30),
          ),
          color: Appcolors.liquidglassColor,
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.infinity,
        child: Row(
          children: [
            SleekCircularSlider(
              initialValue: _percentValue,
              max: 100,
              appearance: CircularSliderAppearance(
                size: 130,
                startAngle: 270,
                angleRange: 360,
                customWidths: CustomSliderWidths(
                  progressBarWidth: 15,
                  trackWidth: 15,
                  handlerSize: 0,
                ),
                customColors: CustomSliderColors(
                  trackColor: Appcolors.whiteOpacity10,
                  progressBarColor: Appcolors.primary,
                  hideShadow: true,
                ),
              ),
              innerWidget: (double value) {
                final percentage = value.toInt();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$percentage',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primary,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'ПЛАН',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                );
              },
              onChange: null,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4 из 5 тренировок',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Appcolors.primary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Отличный темп недели',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Осталось закрыть сессию ног для 100% плана.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}