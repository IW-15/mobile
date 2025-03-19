import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/otp_input.dart';
import 'package:mobile/app/presentation/widgets/register_progress.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/extensions/map_indexed.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterPhonePinPage extends GetView<RegisterController> {
  const RegisterPhonePinPage({super.key});

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
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      "2/5: ",
                      style: h5BTextStyle(
                        color: ColorConstants.slate[400],
                      ),
                    ),
                    Text(
                      " Verifikasi Nomor Handphone",
                      style: h5BTextStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                RegisterProgress(currentStep: 2),
                SizedBox(height: 60.h),
                Text(
                  "Verifikasi nomor handphone",
                  style: body4BTextStyle(),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Masukkan kode OTP yang kami kiirm pada SMS ke\n${controller.form['phone']!.text}",
                  style: body5TextStyle(color: ColorConstants.slate[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1, 2, 3, 4, 5]
                      .mapIndexed((e, i) => OtpInput(
                            index: e,
                            onChange: controller.onCharacterEntered,
                            isLast: i == 5,
                          ))
                      .toList(),
                ),
                Expanded(child: Container()),
                SizedBox(height: 80.h),
                Obx(
                  () => AppButton(
                    onPressed: controller.validPin.value
                        ? controller.registerPhonePin
                        : null,
                    text: "Selanjutnya",
                    width: 1.sw,
                  ),
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
