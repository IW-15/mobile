import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/login_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/input_validator.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableConstraints(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
              20.w,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(
                    "assets/images/login.png",
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Hai, Apa Kabar Hari Ini? 👋 ",
                    style: body3BTextStyle(),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Yuk, masuk dan mulai kejar cuan lagi.",
                    style: body5TextStyle(
                      color: ColorConstants.slate[500],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AppInput(
                    controller: controller.form['phone']!,
                    textInputAction: TextInputAction.next,
                    label: "Nomor Telepon",
                    placeholder: "Input Nomor Telepon",
                    keyboardType: TextInputType.number,
                    validator: (e) => inputValidator(e, "Nomor Telepon"),
                  ),
                  SizedBox(height: 16.h),
                  AppInput(
                    controller: controller.form['password']!,
                    label: "Password",
                    obscureText: true,
                    placeholder: "Input Password",
                    validator: (e) => inputValidator(e, "Password"),
                  ),
                  Expanded(child: Container()),
                  AppButton(
                    onPressed: controller.login,
                    text: "Masuk",
                    width: 1.sw,
                  ),
                  SizedBox(height: 10.h),
                  AppButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.registerTipe);
                    },
                    width: 1.sw,
                    variant: AppButtonVariant.secondary,
                    text: "Daftar Livin' Merchant",
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
