import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class LoanApprovedPage extends GetView<LoanController> {
  const LoanApprovedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: .8.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.w),
                      border: Border.all(color: ColorConstants.slate[200]!),
                    ),
                    height: 380.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/loan_approved.png"),
                        SizedBox(height: 8.h),
                        Text(
                          "Loan Approved",
                          style: h1BTextStyle(),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Hey Livia! Congratulations!",
                          style: body3TextStyle(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "This Amount will be credit\nin your account within\ngiven 2 hrs",
                    style: body3TextStyle(
                      color: ColorConstants.primary[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                color: ColorConstants.slate[400],
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: AppButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.home);
                  },
                  width: 1.sw,
                  text: "Home",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
