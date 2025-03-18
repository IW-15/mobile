import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorConstants {
  static Map<int, Color> slate = {
    25: Color(0xffF9FAFB),
    50: Color(0xffF0F3F9),
    100: Color(0xffE9EFF6),
    200: Color(0xffD7DFE9),
    300: Color(0xffAFBACA),
    400: Color(0xff8897AE),
    500: Color(0xff5E718D),
    600: Color(0xff455468),
    700: Color(0xff3D4A5C),
    800: Color(0xff2D3643),
    900: Color(0xff1C222B),
  };

  static Map<int, Color> primary = {
    50: Color(0xffE6ECFD),
    100: Color(0xffCDD8FB),
    200: Color(0xff9AB1F8),
    300: Color(0xff688BF4),
    400: Color(0xff3564F1),
    500: Color(0xff033DED),
    600: Color(0xff0231BE),
    700: Color(0xff02258E),
    800: Color(0xff01185F),
    900: Color(0xff010C2F),
  };

  static Map<int, Gradient> gradient = {};

  static Map<int, BoxShadow> shadow = {
    1: BoxShadow(
      color: Colors.black.withOpacity(.1),
      offset: Offset(0, 4),
      blurRadius: 4.sp,
    ),
    2: BoxShadow(
      color: Colors.black.withOpacity(.1),
      offset: Offset(0, 4),
      blurRadius: 40.sp,
    ),
  };
  static Color error = Color(0xffFF405F);
}

final ColorScheme appColorScheme = ColorScheme(
  primary: ColorConstants.primary[500]!,
  secondary: ColorConstants.slate[500]!,
  background: ColorConstants.slate[25]!,
  surface: ColorConstants.slate[50]!,
  error: Colors.red[400]!,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onBackground: Colors.black,
  onSurface: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
);
