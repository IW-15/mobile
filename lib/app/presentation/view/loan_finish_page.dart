import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_finish_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class LoanFinishPage extends GetView<LoanFinishController> {
  const LoanFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "",
        leading: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.w),
                border: Border.all(color: ColorConstants.slate[200]!),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/loan_onboard.png",
                    width: 220.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "AI Generated Process",
                    style: h1BTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "your loan submission is processing",
                    style: body3TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Obx(
              () => AppButton(
                onPressed: controller.isFinish.value ? controller.submit : null,
                width: 1.sw,
                text: "Selanjutnya",
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
