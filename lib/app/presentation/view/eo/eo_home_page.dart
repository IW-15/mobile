import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/controller/eo/eo_home_controller.dart';
import 'package:mobile/app/presentation/partials/eo_event/card_event_home.dart';
import 'package:mobile/app/presentation/partials/home/card_event_insight.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class EoHomePage extends GetView<EoHomeController> {
  String currDate = DateFormat('MMMM yyyy').format(DateTime.now());
  EoHomePage({super.key});

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
                items: controller.event
                    .map((e) => CardEventHome(data: e))
                    .toList(),
                options: CarouselOptions(
                  height: 180.w,
                  viewportFraction: 1,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dashboard",
                  style: body5BTextStyle(),
                ),
                Row(
                  children: [
                    Text(
                      currDate,
                      style: body6TextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.eoCashflow);
                      },
                      child: Icon(
                        Icons.chevron_right,
                        size: 20.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.eoCashflow);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [ColorConstants.shadow[1]!],
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: ColorConstants.primary[50],
                              borderRadius: BorderRadius.circular(4.w),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.currency_pound_sharp,
                                color: ColorConstants.primary[500],
                                size: 20.w,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Pendapatan",
                            style: body5BTextStyle(
                              weight: FontWeight.w500,
                              color: ColorConstants.slate[400],
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "Rp10.000.000",
                            style: body3BTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.eoCashflow);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [ColorConstants.shadow[1]!],
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: ColorConstants.primary[50],
                              borderRadius: BorderRadius.circular(4.w),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.task_outlined,
                                color: ColorConstants.primary[500],
                                size: 20.w,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Event Selesai",
                            style: body5BTextStyle(
                              weight: FontWeight.w500,
                              color: ColorConstants.slate[400],
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "5",
                            style: body3BTextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "Event Insights",
              style: body5BTextStyle(),
            ),
            SizedBox(height: 6.h),
            CardEventInsight(),
            CardEventInsight(),
            CardEventInsight(),
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
