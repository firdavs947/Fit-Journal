import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

class TrainingWidget extends StatefulWidget {
  const TrainingWidget({super.key});

  @override
  State<TrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends State<TrainingWidget> {
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
          borderRadius: BorderRadius.circular(40),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'СЕГОДНЯ · ДЕНЬ 3',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Appcolors.primary,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(Assets.icons.timer),
                SizedBox(width: 5),
                Text(
                  '~ 50 мин',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Грудь и дельты',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              '4 упражнения · 14 рабочих подходов',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 14),
            LiquidGlassButton(
              touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
              style: LiquidGlassStyle(
                shape: LiquidGlassShape(cornerRadius: 50.0),
                adaptivity: LiquidGlassAdaptivity(
                  glassColorOnDark: Appcolors.greenAccent4,
                  glassColorOnLight: Appcolors.greenAccent4,
                  continuousGlassColor: true,
                ),
                liteGlass: LiquidGlassLitePickup.blend,
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Начать тренировку',
                  style: TextStyle(fontSize: 18, color: Appcolors.darkBlack),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
