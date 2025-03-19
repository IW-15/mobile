import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardEventNearby extends StatelessWidget {
  const CardEventNearby({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.eventDetail("5"));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [ColorConstants.shadow[1]!],
        ),
        height: 1.sh,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/event_image_dummy.png",
              height: 1000,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1C222B),
                      Colors.white.withAlpha(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Festival Bazar Ramah",
                      style: body4BTextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 18.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "19 Maret 2025",
                          style: body6TextStyle(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Lapangan simatupang Indonesia",
                          style: body6TextStyle(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.3),
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Text(
                  "Next month",
                  style: body6BTextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
