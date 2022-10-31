import 'package:design_system_module/src/common/constants/crypto_colors.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get() {
    return ThemeData(
      scaffoldBackgroundColor: CryptoColors.darkColor,
      backgroundColor: CryptoColors.darkColor,
      fontFamily: 'Neuzeit',
    );
  }
}
