import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_home_controller.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class EoHomePage extends GetView<EoHomeController> {
  const EoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        route: AppRoute.eoHome,
        isSme: false,
      ),
      body: scaffold(Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Livin' merchant",
                  style: h3BTextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.notifications,
                  size: 24.w,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff1136B2),
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                controller.eo.value?.name ?? "",
                                style: body5TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.hexagon,
                                  color: Colors.white,
                                  size: 16.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "1.024 Poin",
                                  style: body5TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 16.w,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 20.w,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Pemilik",
                              style: body5BTextStyle(
                                  color: Colors.white, height: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                [Icons.calendar_month, "Jadwal Event"],
                [Icons.store, "List Tenant"],
                [Icons.bar_chart, "Laporan"],
              ]
                  .map(
                    (e) => SizedBox(
                      width: 95.w,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [ColorConstants.shadow[1]!],
                              ),
                              child: Center(
                                child: Icon(
                                  e[0] as IconData,
                                  color: ColorConstants.primary[500],
                                  size: 24.w,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.w),
                            Text(
                              e[1] as String,
                              style: body5TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.h),
            Text(
              "Event Terdekat",
              style: h5BTextStyle(color: ColorConstants.primary[50]),
            ),
            SizedBox(height: 12.h),
            Container(
              height: 180.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                boxShadow: [
                  ColorConstants.shadow[1]!,
                ],
              ),
              child: CarouselSlider(
                items: [1, 2, 3, 4]
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              "assets/images/event_image_dummy.png",
                              fit: BoxFit.cover,
                              width: 1.sw,
                            ),
                            Positioned(
                              top: 15.w,
                              left: 18.w,
                              right: 18.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Livia's Event",
                                    style: h2BTextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "30 Maret 2025 19.00 WIB",
                                    style: body6BTextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    "Kabupaten Banyumas, Jawa Tengah",
                                    style: body6TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 15.w,
                              right: 18.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 5.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffE0E5FF),
                                  borderRadius: BorderRadius.circular(20.w),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: ColorConstants.primary[500],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 180.w,
                  viewportFraction: 1,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget scaffold(Widget child) {
    return Stack(
      children: [
        Container(
          height: 375.h,
          width: 1.sw,
          color: ColorConstants.primary[500],
        ),
        Column(
          children: [
            Expanded(
              child: ScrollableConstraints(
                child: SafeArea(
                  child: Padding(padding: EdgeInsets.all(20.w), child: child),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
