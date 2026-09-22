import 'package:fitjournal/const/colors/appColors.dart';
import 'package:flutter/material.dart';

class Appthemes {
  static  ThemeData lightTheme (){
   return ThemeData(
        fontFamily: 'Manrope',
      colorScheme: ColorScheme.light(
        primary: Appcolors.primary,
      )
     );
  }

  static ThemeData darkTheme (){
   return ThemeData(
    fontFamily: 'Manrope',
      colorScheme: ColorScheme.dark(
        primary: Appcolors.primary,
      )
     );
  }
}
