import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/img.dart';

class CardEvent extends StatelessWidget {
  final EventModel data;
  const CardEvent({
    super.key,
    required this.data,
  });

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
                child: Image.network(
                  img(data.banner),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data.name,
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
                          "${formatDate(data.date)}, ${convertToWIB(data.time)}",
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
                        Flexible(
                          child: Text(
                            data.location,
                            style: body6TextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
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
