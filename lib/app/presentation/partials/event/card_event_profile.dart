import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/styles/text_styles.dart';

class CardEventProfile extends StatelessWidget {
  final int eventCount;
  const CardEventProfile({
    super.key,
    required this.eventCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1136B2),
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              color: Color(
                0xff0D2C8A,
              ),
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GlobalController.i.profile.value?.merchant.name ?? "",
                      style: body5BTextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      GlobalController.i.profile.value?.merchant.address ?? "",
                      style: body6TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                content(
                  "Event Terdaftar",
                  eventCount.toString(),
                  "Events",
                ),
                content(
                  "Sales",
                  "1.2K",
                  "Events",
                ),
                content(
                  "Revenue",
                  "150 Jt",
                  "Rupiah",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget content(String label, String detail, name) {
    return Column(
      children: [
        Text(
          label,
          style: body5BTextStyle(color: Colors.white),
        ),
        SizedBox(height: 4.h),
        Text(
          detail,
          style: body1TextStyle(size: 24.w, color: Colors.white),
        ),
        Text(
          name,
          style: body6TextStyle(size: 11.w, color: Colors.white),
        ),
      ],
    );
  }
}
