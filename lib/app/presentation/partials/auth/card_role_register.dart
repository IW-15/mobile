import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardRoleRegister extends StatelessWidget {
  final RegisterController controller;
  final String tipeUsaha;
  final String description;
  final String icon;

  const CardRoleRegister({
    super.key,
    required this.controller,
    required this.tipeUsaha,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.tipeUsaha.value = tipeUsaha;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: controller.tipeUsaha.value == tipeUsaha
              ? ColorConstants.primary[50]
              : Colors.white,
          border: controller.tipeUsaha.value == tipeUsaha
              ? Border.all(color: ColorConstants.primary[500]!)
              : null,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            ColorConstants.shadow[1]!,
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                color: Color(0xffE2EAFC),
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  controller.tipeUsaha.value == tipeUsaha
                      ? ColorConstants.primary[500]!
                      : ColorConstants.slate[300]!,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              tipeUsaha,
              style: body4BTextStyle(),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: body5TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
