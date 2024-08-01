import 'package:flutter/material.dart';
import 'package:unavialable/presentation/const/color.dart';

class ThemeDataClass {
  static ThemeData lightTeme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
//================================= Single text =================================
      // displayLarge: TextStyle(
      //   fontFamily: "Radley",
      //   color: ColorsClass.black,
      // ),
      // displayMedium: TextStyle(
      //   fontFamily: "Radley",
      //   color: ColorsClass.white,
      // ),
      // displaySmall: TextStyle(
      //   fontFamily: "Radley",
      //   color: ColorsClass.white,
      // ),
//================================= Big title =================================
      titleLarge: TextStyle(
        fontFamily: "RobotoBlack",
        fontWeight: FontWeight.bold,
        color: ColorClass.black,
      ),
      titleSmall: TextStyle(
        fontFamily: "RobotoRegular",
        fontWeight: FontWeight.normal,
        color: ColorClass.black,
      ),
      bodySmall: TextStyle(
        fontFamily: "RobotoRegular",
        fontWeight: FontWeight.bold,
        color: ColorClass.greyBlack,
      )
      // titleSmall: TextStyle(
      //   fontFamily: "Sacramento",
      //   color: ColorsClass.mintGreen,
      // )
    ),
    primaryColor: ColorClass.whiteGrey,
    // secondaryHeaderColor: ColorsClass.buttonBlue
  );
  static ThemeData darkTheme = ThemeData();
}
/*
#246EE9 - Royal blue
#FF2400 - Scarlet red
#3eb489 - Mint green
 */