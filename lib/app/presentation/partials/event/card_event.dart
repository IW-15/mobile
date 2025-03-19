import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.eventDetail("5"));
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  boxShadow: [ColorConstants.shadow[1]!],
                  borderRadius: BorderRadius.circular(10.w),
                ),
                width: 100.w,
                height: 100.w,
                child: Image.asset(
                  "assets/images/event_image_dummy.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Festival Bazar Ramah",
                      style: body5BTextStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: ColorConstants.primary[500],
                          size: 16.w,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "19 September 2025, 15.00 WIB",
                          style: body6TextStyle(),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorConstants.primary[500],
                          size: 16.w,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Jl. Soekarno Hatta, Malang",
                          style: body6TextStyle(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Stack(
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
                        ),
                        SizedBox(width: 50.w),
                        Text(
                          "+60 terdaftar",
                          style: body6BTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 36.h,
            color: ColorConstants.slate[200],
          )
        ],
      ),
    );
  }
}
