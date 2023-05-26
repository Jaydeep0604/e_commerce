import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray2005e = fromHex('#5eabb4bd');

  static Color gray100A2 = fromHex('#a2f6f6f6');

  static Color red500 = fromHex('#ff3d3d');

  static Color red400 = fromHex('#ef3651');

  static Color blueGray20071 = fromHex('#71abb4bd');

  static Color black9003f = fromHex('#3f000000');

  static Color red8003f = fromHex('#3fd32525');

  static Color blueGray9006c = fromHex('#6c2a2b36');

  static Color black9001e = fromHex('#1e000000');

  static Color green400 = fromHex('#55d75a');

  static Color black900Ba = fromHex('#ba000000');

  static Color black90042 = fromHex('#420a0a0a');

  static Color black90023 = fromHex('#23000000');

  static Color black90000 = fromHex('#00000000');

  static Color red70028 = fromHex('#28db3022');

  static Color black900 = fromHex('#000000');

  static Color blueGray20063 = fromHex('#63abb4bd');

  static Color gray100Ab = fromHex('#abf5f5f5');

  static Color pink50059 = fromHex('#59ef3551');

  static Color redA400 = fromHex('#ff2424');

  static Color black90028 = fromHex('#28000000');

  static Color blueGray900 = fromHex('#2a2b36');

  static Color blueGray90087 = fromHex('#872a2b36');

  static Color gray90063 = fromHex('#63121111');

  static Color green60072 = fromHex('#722aa952');

  static Color gray90002 = fromHex('#1f2028');

  static Color gray90003 = fromHex('#13141a');

  static Color blueGray200 = fromHex('#abb4bd');

  static Color gray500 = fromHex('#9b9b9b');

  static Color gray100A201 = fromHex('#a2f5f5f5');

  static Color blueGray2006c = fromHex('#6cabb4bd');

  static Color gray90000 = fromHex('#001e1f28');

  static Color whiteA700A2 = fromHex('#a2ffffff');

  static Color gray900 = fromHex('#1d1f27');

  static Color gray90001 = fromHex('#1a1b20');

  static Color gray90089 = fromHex('#891e1f28');

  static Color red400Ab = fromHex('#abef3651');

  static Color black9000c = fromHex('#0c000000');

  static Color gray100 = fromHex('#f6f6f6');

  static Color bluegray400 = fromHex('#888888');

  static Color gray10001 = fromHex('#f5f5f5');

  static Color blueGray90099 = fromHex('#992a2b36');

  static Color black90019 = fromHex('#19000000');

  static Color gray40000 = fromHex('#00c4c4c4');

  static Color black90014 = fromHex('#14000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
