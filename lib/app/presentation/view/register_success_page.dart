import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterSuccessPage extends GetView<RegisterController> {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/images/register_success.png"),
              ),
            ),
            Column(
              children: [
                Text(
                  "Pendaftaran Livin' Merchant Berhasil",
                  style: h4BTextStyle(),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Yuk langsung mulai jualan dan nikmati\nkemudahan mengelola usaha di Livin’ Merchant",
                  style: body5TextStyle(
                    color: ColorConstants.slate[400],
                  ),
                ),
                SizedBox(height: 100.h),
                AppButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.landing);
                  },
                  variant: AppButtonVariant.secondary,
                  text: "Beranda Livin' Merchant",
                  width: 1.sw,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
