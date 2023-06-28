import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color transparent = Color(0x00000000);
  static const Color primary = Color(0xFF119744);
  static const Color darkPrimary = Color(0xFF004219);
  static const Color bgColor = Color(0x10607D8B);

  static const Color _black = Color(0xff000000);
  static const Color _blue = Colors.blue;
  static const Color _text = Color(0xff37474f);
  static const Color _gray = Color(0xFF88887E);
  static const Color _red = Color(0xFFDD2339);
  static const Color _shimmerBase = Color(0x7088887E);
  static const Color _shimmerHighlight = Color(0x70119744);
  static const Color _white = Color(0xFFFFFFFF);

  static Color whiteColor() => _white;
  static Color redColor() => _red;
  static Color grayColor() => _gray;
  static Color blackColor() => _black;
  static Color blueColor() => _blue;
  static Color primaryColor() => primary;
  static Color textColor() => _text;
  static Color iconColor() => _text;
  static Color shimmerBaseColor() => _shimmerBase;
  static Color shimmerHighlightColor() => _shimmerHighlight;

}
