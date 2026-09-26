import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/library_provider.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class ListViewLibrary extends StatefulWidget {
  const ListViewLibrary({super.key});

  @override
  State<ListViewLibrary> createState() => _ListViewLibraryState();
}

class _ListViewLibraryState extends State<ListViewLibrary> {
  @override
  Widget build(BuildContext context) {
              final categoryIndex = context.watch<LibraryProvider>().categoryIndex;

    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        context.watch<LibraryProvider>().libraryCategory.length,
        (i) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: LiquidGlassButton(
              onPressed: () {
                context.read<LibraryProvider>().onCategoryChanged(i);
              },
              touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
              style: LiquidGlassStyle(
                shape: LiquidGlassShape(
                  cornerRadius: 25.0,
                  borderColor: categoryIndex == i
                      ? Appcolors.selectedWrapIconColor
                      : Colors.transparent,
                ),
                adaptivity: LiquidGlassAdaptivity(
                  glassColorOnDark: categoryIndex == i
                      ? Appcolors.selectedWrapColor
                      : Appcolors.whiteOpacity10,
                  glassColorOnLight: categoryIndex == i
                      ? Appcolors.selectedWrapColor
                      : Appcolors.whiteOpacity10,
                  continuousGlassColor: true,
                ),
                liteGlass: LiquidGlassLitePickup.blend,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                child: Center(
                  child: Text(
                    context.watch<LibraryProvider>().libraryCategory[i],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: categoryIndex == i
                          ? Appcolors.selectedWrapIconColor
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
