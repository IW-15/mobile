import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_onboard_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class LoanOnboardPage extends GetView<LoanOnboardController> {
  const LoanOnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "",
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              "Livin’ Loan",
              style: h1BTextStyle(
                color: ColorConstants.primary[500],
              ),
            ),
            SizedBox(height: 20.h),
            Image.asset(
              "assets/images/loan_onboard.png",
              height: 220.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffE0E5FF),
                borderRadius: BorderRadius.circular(15.w),
              ),
              padding: EdgeInsets.all(16.w),
              width: 1.sw,
              child: Column(
                children: [
                  Text(
                    "DAPATKAN LIMIT S/D",
                    style: body3TextStyle(
                      color: ColorConstants.primary[500],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Rp 50.000.000",
                    style: body2BTextStyle(
                      color: ColorConstants.primary[500],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  AppButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.loanSk);
                    },
                    text: "",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ajukan Sekarang",
                          style: body4BTextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 22.w,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 20.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Features:",
                    style: body5BTextStyle(),
                  ),
                  SizedBox(height: 8.h),
                  ...[
                    [
                      Icons.restore,
                      "Quick repayment available",
                    ],
                    [
                      Icons.download_outlined,
                      "The amount will be credited within 1 hour.",
                    ],
                    [
                      Icons.thumb_up_outlined,
                      "NOC will be share within 48 hrs.",
                    ],
                    [
                      Icons.verified_outlined,
                      "Financial tips",
                    ],
                  ].map(
                    (e) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      child: Row(
                        children: [
                          Container(
                            width: 25.w,
                            height: 25.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff5B93FF).withValues(
                                alpha: .5,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                e[0] as IconData,
                                color: ColorConstants.primary[500],
                                size: 18.w,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: Text(
                              e[1] as String,
                              style: body5TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
