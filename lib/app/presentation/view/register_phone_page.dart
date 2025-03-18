import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/register_progress.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterPhonePage extends GetView<RegisterController> {
  const RegisterPhonePage({super.key});

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
                SizedBox(height: 20.h),
                Image.asset(
                  "assets/images/register_rekening.png",
                ),
                SizedBox(height: 16.h),
                Text(
                  "Tambahkan Nomor Teleponmu",
                  style: h4BTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Tambah nomor telepon kamu supaya bisa terhubung",
                  style: body5TextStyle(
                    color: ColorConstants.slate[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                AppInput(
                  label: "Nomor Telepon",
                  controller: controller.form['phone']!,
                  placeholder: "Contoh: 0812312312",
                  keyboardType: TextInputType.number,
                  onChange: (e) {
                    controller.form.refresh();
                  },
                ),
                SizedBox(height: 80.h),
                Expanded(child: Container()),
                Obx(
                  () => AppButton(
                    onPressed: controller.form['phone']!.text == ""
                        ? null
                        : controller.checkPhone,
                    text: "Selanjutnya",
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
