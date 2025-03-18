import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mobile/styles/color_constants.dart';

class RegisterProgress extends StatelessWidget {
  final int currentStep; // current step (from 1 to 5)

  const RegisterProgress({super.key, required this.currentStep})
      : assert(currentStep >= 1 && currentStep <= 5);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            width: 50.w,
            height: 6, // height of each box
            decoration: BoxDecoration(
              color: index < currentStep
                  ? ColorConstants.primary[400]
                  : ColorConstants.slate[300], // filled or unfilled color
              borderRadius: BorderRadius.circular(8), // rounded corners
            ),
          ),
        );
      }),
    );
  }
}
