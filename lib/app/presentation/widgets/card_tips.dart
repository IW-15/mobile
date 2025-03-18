import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardTips extends StatelessWidget {
  final String text;
  const CardTips({
    super.key,
    required this.text,
  });

  int _generateRandomNumber() {
    return Random().nextInt(3) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/tips_${_generateRandomNumber()}.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 22.w,
                left: 22.w,
                right: 22.w,
                bottom: 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: body3BTextStyle(
                      color: ColorConstants.primary[500],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      "All icons respect Figma’s component overrides like stroke and color changes. Crafted pixel precise with a 2px stroke and neatly organized in variants.",
                      style: body6TextStyle(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Learn More",
                        style: body6BTextStyle(
                          color: ColorConstants.primary[500],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: ColorConstants.primary[500],
                        size: 14.w,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
