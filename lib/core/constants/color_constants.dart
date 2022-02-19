import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance => _instance ??= ColorConstants._init();
  ColorConstants._init();

  final Color titleColor = const Color.fromRGBO(78, 78, 78, 1);
  final Color tfBorderColor = const Color.fromRGBO(204, 204, 204, 1);
  final Color tfBackgroundColor = const Color.fromRGBO(106, 184, 253, 1);
  final Color buttonBackgroundColor = const Color.fromRGBO(220, 41, 95, 1);
  final Color bodyTextColor = const Color.fromRGBO(203, 203, 203, 1);
  final Color subTitleColor = const Color.fromRGBO(127, 127, 127, 1);
  final Color black = const Color.fromRGBO(0, 0, 0, 1);
  final Color white = const Color.fromRGBO(255, 255, 255, 1);
}
