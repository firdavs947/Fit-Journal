import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class CustomTraining extends StatefulWidget {
  const CustomTraining({
    super.key,
    required this.id,
    required this.title,
    required this.time,
    required this.label,
  });

  final String id;
  final String title;
  final String time;
  final String label;

  @override
  State<CustomTraining> createState() => _CustomTrainingState();
}

class _CustomTrainingState extends State<CustomTraining> {
  @override
  Widget build(BuildContext context) {
    final isChecked = context.watch<HomeProvider>().isSelected(widget.id);

    return GestureDetector(
      onTap: () {
        context.read<HomeProvider>().toggleSelection(widget.id);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isChecked
              ? Appcolors.selectedWrapColor
              : Appcolors.containerColor2,
          border: Border.all(
            color: isChecked
                ? Appcolors.selectedWrapIconColor
                : Appcolors.containerColor2,
          ),
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: CupertinoCheckbox(
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Appcolors.selectedWrapIconColor;
                  }
                  return Appcolors.containerColor2;
                }),
                checkColor: Appcolors.wrapColor,
                value: isChecked,
                onChanged: (_) {
                  context.read<HomeProvider>().toggleSelection(widget.id);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isChecked
                        ? Appcolors.selectedWrapIconColor
                        : Colors.white,
                  ),
                ),
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            LiquidGlassButton(
              height: 30,
              touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
              style: LiquidGlassStyle(
                shape: LiquidGlassShape(cornerRadius: 15.0),
                adaptivity: LiquidGlassAdaptivity(
                  glassColorOnDark: Appcolors.whiteOpacity10,
                  glassColorOnLight: Appcolors.whiteOpacity10,
                  continuousGlassColor: true,
                ),
                liteGlass: LiquidGlassLitePickup.blend,
              ),
              child: Container(
                height: 21,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}