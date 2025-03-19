import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/register_progress.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterRekeningPage extends GetView<RegisterController> {
  const RegisterRekeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: ""),
      body: ScrollableConstraints(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "1/5: ",
                      style: h5BTextStyle(
                        color: ColorConstants.slate[400],
                      ),
                    ),
                    Text(
                      " Pendaftaran Rekening",
                      style: h5BTextStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                RegisterProgress(currentStep: 1),
                SizedBox(height: 20.h),
                Image.asset(
                  "assets/images/register_rekening.png",
                ),
                SizedBox(height: 16.h),
                Text(
                  "Kelola ${controller.isUMKM.value ? "Usaha" : "Events"} Jadi Makin Gampang",
                  style: h4BTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Kamu hanya perlu nomor rekening Bank Mandiri\nuntuk mendaftar",
                  style: body5TextStyle(
                    color: ColorConstants.slate[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                AppInput(
                  controller: controller.form['rekening']!,
                  label: "Nomor Rekening Mandiri",
                  placeholder: "Contoh: 1234123412",
                  onChange: (e) {
                    controller.form.refresh();
                  },
                ),
                SizedBox(height: 12.h),
                AppInput(
                  controller: TextEditingController(),
                  label: "Kode Referral (Optional)",
                  placeholder: "Contoh: 1234123412",
                ),
                SizedBox(height: 40.h),
                Expanded(child: Container()),
                Obx(
                  () => AppButton(
                    onPressed: controller.form['rekening']!.text == ""
                        ? null
                        : () {
                            Get.toNamed(AppRoute.registerPhone);
                          },
                    text: "Daftarkan Usaha Saya",
                    width: 1.sw,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Belum punya rekening?",
                  style: body4TextStyle(
                    color: ColorConstants.slate[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Buka Rekening Bank Mandiri',
                  style: body4BTextStyle(
                    color: ColorConstants.primary[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
