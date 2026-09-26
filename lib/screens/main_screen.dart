import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/screens/training_screen.dart';
import 'package:fitjournal/screens/home_screen.dart';
import 'package:fitjournal/screens/library_screen.dart';
import 'package:fitjournal/screens/proggress_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final List<LiquidGlassTabBarItem> _items = const [
    LiquidGlassTabBarItem(icon: CupertinoIcons.house_fill, label: 'Home'),
    LiquidGlassTabBarItem(icon: CupertinoIcons.book_fill, label: 'Library'),
    LiquidGlassTabBarItem(icon: CupertinoIcons.add, label: 'Add'),
    LiquidGlassTabBarItem(icon: CupertinoIcons.graph_square, label: 'Proggress'),
  ];

  late final List<Widget> _screens = const [
    HomeScreen(),
    LibraryScreen(),
    TrainingScreen(),
    ProggressScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return LiquidGlassScaffold(
      body: _screens[_index],
      bottomNavigationBar: LiquidGlassTabBar(
        itemStyle: LiquidGlassTabItemStyle(
            labelFontSize: 11,
            selectedColor: Appcolors.primary,
            iconSize: 27),
        items: _items,
        selectedIndex: _index,
        onChanged: (i) => setState(() => _index = i),
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 68,
        style: LiquidGlassStyle(
          shape: const LiquidGlassShape.continuousRoundedRectangle(
            cornerRadius: 34,
          ),
          appearance: LiquidGlassAppearance(
            blur: const LiquidGlassBlur(sigmaX: 35.0, sigmaY: 35.0),
            saturation: 1.0,
          ),
          refraction: const LiquidGlassRefraction(distortion: 0.08),
        ),
      ),
    );
  }
}