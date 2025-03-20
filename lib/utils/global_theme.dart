import 'package:flutter/material.dart';
import 'package:mobile/styles/color_constants.dart';

ThemeData globalTheme() {
  return ThemeData(
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: Color(0xffF2F3F8),
    colorScheme: appColorScheme,
  );
}
