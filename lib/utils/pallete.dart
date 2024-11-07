import 'package:flutter/material.dart';

class Pallete{
  static const Color colorPrimary = Color(0xFF21367B);
  static const Color colorSecondary = Color(0xFFD92332);
  static const Color background1Color = Colors.white;
  static const Color gradient1 = Colors.black12;
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Colors.black12;
  static const Color background2Color = Color(0xff1C4785);

  
  static const Color textPrimaryBlack = Colors.black;
  static const Color textPrimaryGrey = Color(0xffA4A4A8);

  static String toHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}