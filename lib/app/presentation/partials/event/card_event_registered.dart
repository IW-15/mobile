import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_date.dart';

class CardEventRegistered extends StatelessWidget {
  final EventRegisteredModel data;
  const CardEventRegistered({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorConstants.primary[500]!,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.event.name,
                  style: body4BTextStyle(),
                ),
                SizedBox(height: 7.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.primary[400],
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Text(
                    formatDate(data.date),
                    style: body6TextStyle(
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),
                SizedBox(height: 7.h),
                RichText(
                  text: TextSpan(
                    text: "Status: ",
                    children: [
                      TextSpan(
                        text: data.status,
                        style: body6BTextStyle(
                          weight: FontWeight.bold,
                          color: ColorConstants.primary[400],
                        ),
                      ),
                    ],
                    style: body6BTextStyle(
                      weight: FontWeight.w600,
                      color: ColorConstants.slate[700],
                    ),
                  ),
                ),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tanggal: ${formatDate(data.date)}",
                      style: body6BTextStyle(color: ColorConstants.slate[500]),
                    ),
                    Row(
                      children: [
                        Text(
                          "Get Insight",
                          style: body6TextStyle(),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 16.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
