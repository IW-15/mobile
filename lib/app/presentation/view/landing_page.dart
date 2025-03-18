import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/landing_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/show_alert.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 32.h,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/landing.png",
                width: 400.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: ColorConstants.primary[400],
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                  ),
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: ColorConstants.primary[100],
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                  ),
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: ColorConstants.primary[100],
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                "Kelola Pesanan dan Catatan\nKeuangan di Satu Aplikasi",
                style: h3BTextStyle(),
                textAlign: TextAlign.center,
              ),
              Expanded(child: Container()),
              AppButton(
                onPressed: () {
                  Get.toNamed(AppRoute.registerTipe);
                },
                text: "Daftar Livin' Merchant",
                width: 1.sw,
              ),
              SizedBox(height: 12.h),
              AppButton(
                variant: AppButtonVariant.secondary,
                onPressed: () async {
                  Get.toNamed(AppRoute.login);
                },
                text: "Masuk",
                width: 1.sw,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
