import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RepaymentSuccessPage extends GetView<LoanController> {
  const RepaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "",
        leading: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/loan_onboard.png",
                    width: 220.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Pembayaran Berhasil",
                    style: h4BTextStyle(),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Pembayaran cicilan Anda telah dikonfirmasi.\nTerima kasih telah melakukan pembayaran tepat waktu!",
                    style: body5TextStyle(
                      color: ColorConstants.slate[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.h),
            AppButton(
              onPressed: () {
                Get.back();
              },
              text: "Kembali",
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
