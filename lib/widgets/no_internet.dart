import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/gen/assets.gen.dart';
import 'package:fitjournal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';


class NoInterner extends StatelessWidget {
  const NoInterner({super.key});
  static widgetnikorsatish() {
    
    showModalBottomSheet(context: navigatorkey.currentState!.context,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: false,
     builder: (context) => NoInterner());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
            canPop: false,

      child: Container(
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
          color: Appcolors.scaffoldBodyColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Connection Lost try again!' ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Appcolors.primary),),
              IconButton(
                onPressed: () {
                  openAppSettings();
                },
                icon: SvgPicture.asset(Assets.icons.noInternet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
