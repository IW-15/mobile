import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/register_progress.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterEmailPage extends GetView<RegisterController> {
  const RegisterEmailPage({super.key});

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
              key: controller.formEmailKey,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        "3/5: ",
                        style: h5BTextStyle(
                          color: ColorConstants.slate[400],
                        ),
                      ),
                      Text(
                        " Tambahkan Email Anda",
                        style: h5BTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RegisterProgress(currentStep: 3),
                  SizedBox(height: 20.h),
                  Image.asset(
                    "assets/images/register_email.png",
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Tambahkan Alamat Emailmu",
                    style: h4BTextStyle(),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Kamu hanya perlu alamat email untuk mendaftar",
                    style: body5TextStyle(
                      color: ColorConstants.slate[600],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AppInput(
                    validator: controller.emailValidator,
                    controller: controller.form['email']!,
                    label: "Email",
                    placeholder: "Contoh: email@livin.id",
                    onChange: (e) {
                      controller.form.refresh();
                    },
                  ),
                  Expanded(child: Container()),
                  SizedBox(height: 40.h),
                  AppButton(
                    onPressed: controller.registerEmail,
                    text: "Selanjutnya",
                    width: 1.sw,
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
