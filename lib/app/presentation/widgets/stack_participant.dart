import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class StackParticipant extends StatelessWidget {
  const StackParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 28.w,
          height: 28.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellowAccent,
            boxShadow: [ColorConstants.shadow[1]!],
          ),
          child: Center(
            child: Text(
              "LV",
              style: body6BTextStyle(
                height: 1,
                color: ColorConstants.primary[500],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20.w,
          child: Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellowAccent,
              boxShadow: [ColorConstants.shadow[1]!],
            ),
            child: Center(
              child: Text(
                "AG",
                style: body6BTextStyle(
                  height: 1,
                  color: ColorConstants.primary[500],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 40.w,
          child: Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellowAccent,
              boxShadow: [ColorConstants.shadow[1]!],
            ),
            child: Center(
              child: Text(
                "AB",
                style: body6BTextStyle(
                  height: 1,
                  color: ColorConstants.primary[500],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
