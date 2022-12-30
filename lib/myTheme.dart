import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffffffff);
  static Color redColor = Color(0xffc91c22);
  static Color darkBlueColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color greyColor = Color(0xFFD7D2D2);
  static Color blackColor = Color(0xff303030);


  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primaryLightColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
