import 'package:esay_app/core/utils/appColors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle appTitle = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1D1D1F),
  );

  static const TextStyle numberText = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static TextStyle smallText = TextStyle(
    fontFamily: 'Shamel',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff2A72AD),
  );

  static TextStyle bodyText = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const TextStyle titleText = TextStyle(
    fontFamily: "Shamel",
    fontSize: 26,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xFF3C3C43),
  );

  static const TextStyle tileTiltle = TextStyle(
    fontFamily: 'Shamel',
    fontSize: 14,
    fontWeight: FontWeight.w200,
    color: Colors.black,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Color(0xFF636366),
  );

  static const TextStyle arabicBodyCentered = TextStyle(
    fontFamily: 'MadaniArabic-Regular',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.86,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle textTajawal = TextStyle(
    fontFamily: "Tajawal",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static const TextStyle text14 = TextStyle(
    fontFamily: "Shamel",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle text16 = TextStyle(
    fontFamily: "Shamel",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
