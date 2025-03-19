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

class RegisterPasswordPage extends GetView<RegisterController> {
  const RegisterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableConstraints(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Form(
              key: controller.formPasswordKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        "4/5: ",
                        style: h5BTextStyle(
                          color: ColorConstants.slate[400],
                        ),
                      ),
                      Text(
                        " Buat Password",
                        style: h5BTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RegisterProgress(currentStep: 4),
                  SizedBox(height: 20.h),
                  Image.asset("assets/images/register_password.png"),
                  SizedBox(height: 12.h),
                  Text(
                    "Buat Password Livin' Merchant",
                    style: h4BTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Pastikan passwordmu minimal 8 karakter.",
                    style: body5TextStyle(
                      color: ColorConstants.slate[400],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  AppInput(
                    label: "Password",
                    controller: controller.form['password']!,
                    obscureText: true,
                    placeholder: "Input Password",
                    validator: controller.passwordValidator,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    label: "Konfirmasi Password",
                    placeholder: "Input Konfirmasi Password",
                    controller: controller.form['password_confirmation']!,
                    obscureText: true,
                    validator: controller.confirmPasswordValidator,
                  ),
                  SizedBox(height: 40.h),
                  Expanded(child: Container()),
                  AppButton(
                    onPressed: controller.registerPassword,
                    text: "Selanjutnya",
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
