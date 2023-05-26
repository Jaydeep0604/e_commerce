import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xffEF3651);
  // static const Color primaeyColor2 = Color(0xff4A6495);
  static const Color greyColor = Color(0xffABB4BD);
  static const Color backgroundColor = Color(0xff1E1F28);
  static const Color darkColor = Color(0xff2A2C36);
  static const Color whiteColor = Color(0xffF6F6F6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blck = Color(0xFF000000);
  static const Color errorColor = Color(0xffFF2424);
  static Color successColor = fromHex('#55D85A');
  static const Color sale_hotColor = Color(0xffFF3E3E);
  static const Color ordinarytextColor = Color(0xffF5F5F5);
  static const Color ratingColor = Color(0xffFFBA49);
  static const Color switchOffColor = Color(0xffABB4BD);
  static const Color orangeColor = Color(0xffF48117);
  static const Color lightPinkColor = Color(0xffBEA9A9);
  static const Color lightGreenColor = Color(0xff91BA4F);
  static const Color panToneColor = Color(0xff2CB1B1);
  
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
