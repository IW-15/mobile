import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/presentation/partials/home/card_income.dart';
import 'package:mobile/app/presentation/partials/home/home_cashflow.dart';
import 'package:mobile/app/presentation/partials/home/info_merchant.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        route: AppRoute.home,
      ),
      body: Stack(
        children: [
          Container(
            height: 375.h,
            width: 1.sw,
            color: ColorConstants.primary[500],
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16.h),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        GlobalController.i.profile.value?.user
                                                .fullName ??
                                            "",
                                        style:
                                            body5TextStyle(color: Colors.white),
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
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          GlobalController.i.profile.value
                                                  ?.merchant.name ??
                                              "",
                                          style: body5BTextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          GlobalController.i.profile.value
                                                  ?.merchant.address ??
                                              "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: body6TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          [Icons.receipt_long, "Pesanan"],
                          [Icons.calculate_outlined, "Kasir"],
                          [Icons.bar_chart, "Laporan"]
                        ]
                            .map(
                              (e) => Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      e[0] as IconData,
                                      color: ColorConstants.primary[500],
                                      size: 24.w,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    e[1] as String,
                                    style: body5TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 20.h),
                      CardIncome(),
                      SizedBox(height: 20.h),
                      HomeCashflow(),
                      SizedBox(height: 20.h),
                      InfoMerchant(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
