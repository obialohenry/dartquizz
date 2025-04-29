import 'package:flutter/material.dart';

class AppColors {
  static const kWhite = Colors.white;
  static const kPrimaryGradientTwilightGlow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF3F51B5), Color(0xFFF5F7FA)],
  );
  static const kIndigoOcean = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF3F51B5), Color(0xFF00BCD4)],
    stops: [0.0, 1.0],
  );
  static const kPaleLavender = Color(0xffFBF5FF);
  static const kDeepPurple = Color(0xff530080);
  static const kWhisperGray = Color(0xFFF5F7FA);
  static const kRoyalIndigo = Color(0xFF3F51B5);
  static const kCosmicBlue = Color(0xFF3F51B5);
  static const kCharcoalBlack = Color(0xff212121);
  static const kSteelGray = Color(0xff757575);
  static const kFlameOrange = Color(0xFFFF5722);
}
