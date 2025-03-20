import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/presentation/partials/eo_event/card_eo_event.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class EoDateCategoricalEvent extends StatelessWidget {
  const EoDateCategoricalEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.w),
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              padding: EdgeInsets.all(6.w),
              width: 52.w,
              child: Column(
                children: [
                  Text(
                    "MAR",
                    style: body5BTextStyle(
                      color: ColorConstants.slate[600],
                    ),
                  ),
                  Divider(
                    color: ColorConstants.slate[600],
                  ),
                  Text(
                    "01",
                    style: body4BTextStyle(
                      color: ColorConstants.slate[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                children: [
                  CardEoEvent(),
                  CardEoEvent(),
                  CardEoEvent(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
