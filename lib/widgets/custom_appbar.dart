import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/home_provider.dart';
import 'package:fitjournal/screens/profile_screren.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _CustomAppbarState extends State<CustomAppbar> {
  final _box = GetStorage();
  String _userName = 'Александр';

  @override
  void initState() {
    super.initState();

    _userName = _box.read('profile_name') ?? 'Александр';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().loadFits();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Appcolors.scaffoldBodyColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'С возвращением ',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          Text(
            _userName,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actionsPadding: EdgeInsetsGeometry.only(right: 20, top: 10),
      actions: [
        GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => ProfileScreen()),
            );
            setState(() {
              _userName = _box.read('profile_name') ?? 'Александр';
            });
          },
          child: LiquidGlassButton(
            height: 70,
            width: 70,
            touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
            style: LiquidGlassStyle(
              adaptivity: LiquidGlassAdaptivity(
                glassColorOnDark: Appcolors.whiteOpacity10,
                glassColorOnLight: Appcolors.whiteOpacity10,
                continuousGlassColor: true,
              ),
              liteGlass: LiquidGlassLitePickup.blend,
            ),
            child: Icon(Icons.person_2, color: Appcolors.primary, size: 30),
          ),
        ),
      ],
    );
  }
}