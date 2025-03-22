import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterEoSuccessPage extends GetView<RegisterController> {
  const RegisterEoSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/images/register_eo_success.png"),
              ),
            ),
            Column(
              children: [
                Text(
                  "Akun Event Organizer Berhasil Dibuat",
                  style: h4BTextStyle(),
                ),
                SizedBox(height: 10.h),
                Text(
                  "=SIlakan cek email yang sudah\ndimasukkan untuk info aktivasi akun",
                  style: body5TextStyle(
                    color: ColorConstants.slate[400],
                  ),
                ),
                SizedBox(height: 100.h),
                AppButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.login);
                  },
                  variant: AppButtonVariant.secondary,
                  text: "Masuk Livin' Merchant",
                  textStyle: h4BTextStyle(color: ColorConstants.primary[400]),
                  color: Colors.white,
                  width: 1.sw,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Tidak Dapat Email?",
                  style: body5TextStyle(
                    color: ColorConstants.slate[500],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Kirim Ulang",
                  style: body5BTextStyle(
                    color: ColorConstants.primary[500],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
