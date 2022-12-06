import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'Public-sans',
  primaryColor: MyColors.primaryColor,
  scaffoldBackgroundColor: MyColors.backgroundColor,

  unselectedWidgetColor: MyColors.primaryColor,
  iconTheme: const IconThemeData(color: MyColors.primaryColor),
  buttonTheme: const ButtonThemeData(
    buttonColor: MyColors.primaryColor,
  ),

  appBarTheme: const AppBarTheme(
    color: MyColors.primaryColor,
    iconTheme: IconThemeData(color: MyColors.whiteColor),
    actionsIconTheme: IconThemeData(color: MyColors.whiteColor),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: MyColors.whiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: MyColors.whiteColor,
    hintStyle: MyTextStyles.hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          color: MyColors.primaryColor, style: BorderStyle.solid, width: 1),
      borderRadius: BorderRadius.all(MyShapes.radiusCircular),
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(MyShapes.radiusCircular)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      maximumSize: const Size(281, 50),
      minimumSize: const Size(281, 50),
      foregroundColor: Colors.white,
      backgroundColor: MyColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // foreground
    ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: MyColors.primaryColor,
    padding: EdgeInsets.zero,
  )),
  cardTheme: CardTheme(
      elevation: 4,
      shadowColor: MyColors.greyColor,
      shape: RoundedRectangleBorder(borderRadius: MyShapes.cardBorders),
      color: MyColors.whiteColor),
  // ignore: prefer_const_constructors
);

class MyColors {
  static const Color primaryColor = Color(0xff07c9c4);
  static const Color backgroundColor = Color(0xFF616161);
  static const Color greyColor = Color(0xff919EAB);
  static const Color greenColor = Color(0xffC3F1AE);
  static const Color blueColor = Color(0xff95B3E2);
  static const Color redColor = Color(0xffFF4842);
  static const Color whiteColor = Colors.white;

  static const fontColor1 = Color(0xff2E2E2E);

  static const hintTextColor = Color(0xffA5A5A5);
}

class MyTextStyles {
  static const TextStyle hintText = TextStyle(
      // fontFamily: 'Public-sans',
      fontStyle: FontStyle.italic,
      fontSize: 16,
      color: MyColors.hintTextColor);

  static const TextStyle h1 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    // height: 80,
    fontSize: 96,
  );
  static const TextStyle h2 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    // height: 64,
    fontSize: 61,
  );
  static const TextStyle h3 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    // height: 48,
    fontSize: 49,
  );
  static const TextStyle h4 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    // height: 36,
    fontSize: 35,
  );
  static const TextStyle h5 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    // height: 30,
    fontSize: 24,
  );
  static const TextStyle h6 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    // height: 28,
    fontSize: 20,
  );
  static const TextStyle subtitle1 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    // height: 24,
  );

  static const TextStyle subtitle2 = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    // height: 22,
    fontSize: 14,
  );

  static const TextStyle link = TextStyle(
    // fontFamily: 'Public-sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: MyColors.blueColor,
  );
}

class MyShapes {
  static BorderRadiusGeometry checkboxBorders = BorderRadius.circular(5.0);
  static BorderRadiusGeometry circularBorders = BorderRadius.circular(2.0);
  static Radius radiusCircular = const Radius.circular(2.0);
  static BorderRadiusGeometry cardBorders = BorderRadius.zero;
  static BorderRadius circularBordersClipRRect = BorderRadius.circular(4);
}

class MySizes {
  static double minimumHeightInput = 40;
}
