import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/color_constants.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool val) onChange;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border(
            right: BorderSide(
              color: ColorConstants.primary[200]!,
              width: 2.w,
            ),
            bottom: BorderSide(
              color: ColorConstants.primary[200]!,
            ),
          ),
        ),
        padding: EdgeInsets.all(3.w),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: value ? ColorConstants.primary[500] : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 12.w,
          height: 12.w,
        ),
      ),
    );
  }
}
