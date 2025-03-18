import 'package:flutter/material.dart';
import 'package:mobile/styles/color_constants.dart';

ThemeData globalTheme() {
  return ThemeData(
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: ColorConstants.slate[50],
    colorScheme: appColorScheme,
  );
}
