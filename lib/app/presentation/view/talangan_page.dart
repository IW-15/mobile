import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/talangan_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/presentation/partials/talangan/card_talangan.dart';
import 'package:mobile/app/presentation/partials/talangan/credit_score.dart';
import 'package:mobile/app/presentation/partials/talangan/financial_tips.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/text_styles.dart';

class TalanganPage extends GetView<TalanganController> {
  const TalanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(route: AppRoute.talangan),
      body: Stack(
        children: [
          Positioned(
            top: -400.h,
            left: -450.w,
            child: Image.asset(
              "assets/images/talangan_bg.png",
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Hi, Livia Mandira",
                      style: h3BTextStyle(),
                    ),
                    SizedBox(height: 22.h),
                    Obx(
                      () => CardTalangan(data: controller.loanProfile.value),
                    ),
                    SizedBox(height: 10.h),
                    AppButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.loan);
                      },
                      text: "Ajukan Talangan",
                      color: Color(0xff09AE9A),
                      textStyle: body5BTextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => controller.creditScore.value == null
                          ? SizedBox(height: 300)
                          : CreditScore(data: controller.creditScore.value!),
                    ),
                    // controller.creditScore.value == null
                    //     ? SizedBox(height: 300)
                    //     : Obx(
                    //         () => CreditScore(
                    //             data: controller.creditScore.value!),
                    //       ),
                    SizedBox(height: 40.h),
                    FinancialTips(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
