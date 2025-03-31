import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray200 = fromHex('#bac1ce');

  static Color blueGray100 = fromHex('#d6dae2');

  static Color black900B2 = fromHex('#b2000000');

  static Color blue700 = fromHex('#1976d2');

  static Color blueGray400 = fromHex('#74839d');

  static Color blueGray50 = fromHex('#eaecf0');

  static Color blueA700 = fromHex('#0061ff');

  static Color blueGray600 = fromHex('#5f6c86');

  static Color blueGray40090 = fromHex('#9074839d');

  static Color gray900 = fromHex('#2a2a2a');

  static Color blueGray30087 = fromHex('#87919eab');

  static Color gray50 = fromHex('#f9fbff');

  static Color blue50 = fromHex('#eef4ff');

  static Color gray100 = fromHex('#f2f2f2');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color black900 = fromHex('#000000');

  static Color blueGray800 = fromHex('#37334d');

  static Color blueGray700 = fromHex('#424c5d');

  static Color blue5001 = fromHex('#e0ebff');

  static Color blueGray900 = fromHex('#262b35');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
