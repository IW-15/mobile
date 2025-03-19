import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterPasswordConfirmPage extends GetView<RegisterController> {
  const RegisterPasswordConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableConstraints(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/password-confirm.png",
                        width: 320.w,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Password Berhasil Disimpan",
                        style: body3BTextStyle(),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Mulai sekarang, kamu bisa masuk ke Livin' Merchant dengan nomor handphone dan password yang sudah disimpan.",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                AppButton(
                  onPressed: controller.registerPasswordConfirm,
                  text: "Lengkapi Data Usaha",
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
