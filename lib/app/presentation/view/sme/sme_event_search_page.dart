import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme_event_controller.dart';
import 'package:mobile/app/presentation/partials/event/card_event.dart';
import 'package:mobile/app/presentation/partials/event/card_event_nearby.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SmeEventSearchPage extends GetView<SmeEventController> {
  const SmeEventSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Cari Events",
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorConstants.primary[500],
                        size: 20.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Lokasi Anda',
                        style: body5TextStyle(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Surabaya",
                        style: body5BTextStyle(
                          color: ColorConstants.primary[500],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: ColorConstants.primary[500],
                        size: 20.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Event Terdekat",
                  style: body4TextStyle(),
                ),
                Row(
                  children: [
                    Text(
                      "Lihat Semua",
                      style: body6BTextStyle(
                        color: ColorConstants.primary[500],
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.chevron_right,
                        size: 18.w,
                        color: ColorConstants.primary[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                enlargeFactor: .25,
                clipBehavior: Clip.none,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return CardEventNearby();
              }).toList(),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Event Terpopuler",
                  style: body4TextStyle(),
                ),
                Row(
                  children: [
                    Text(
                      "Lihat Semua",
                      style: body6BTextStyle(
                        color: ColorConstants.primary[500],
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.chevron_right,
                        size: 18.w,
                        color: ColorConstants.primary[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            CardEvent(),
            CardEvent(),
            CardEvent(),
            CardEvent(),
            CardEvent(),
          ],
        ),
      ),
    );
  }
}
