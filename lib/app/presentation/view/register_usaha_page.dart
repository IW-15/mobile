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
import 'package:mobile/utils/input_validator.dart';

class RegisterUsahaPage extends GetView<RegisterController> {
  const RegisterUsahaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableConstraints(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: controller.formProfileKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "5/5: ",
                        style: h5BTextStyle(
                          color: ColorConstants.slate[400],
                        ),
                      ),
                      Text(
                        " Lengkapi Informasi Akun",
                        style: h5BTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RegisterProgress(currentStep: 5),
                  SizedBox(height: 20.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    label: "Nama Lengkap",
                    controller: controller.form['fullName']!,
                    placeholder: "Input Nama Lengkap Anda",
                    validator: (e) => inputValidator(e, "Nama Lengkap"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    label: "Nama Depan",
                    controller: controller.form['firstName']!,
                    placeholder: "Input Nama Depan Anda",
                    validator: (e) => inputValidator(e, "Nama Depan"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    label: "Nama Belakang",
                    controller: controller.form['lastName']!,
                    placeholder: "Input Nama Belakang Anda",
                    validator: (e) => inputValidator(e, "Nama Belakang"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    label: "Nama Merchant",
                    controller: controller.form['merchantName']!,
                    placeholder: "Input Nama Merchant Anda",
                    validator: (e) => inputValidator(e, "Nama Merchant"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    label: "Alamat Merchant",
                    controller: controller.form['merchantAddress']!,
                    placeholder: "Input Alamat Merchant Anda",
                    maxLines: 5,
                    validator: (e) => inputValidator(e, "Alamat Merchant"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    label: "Nomor Telepon Merchant",
                    keyboardType: TextInputType.number,
                    controller: controller.form['merchantPhone']!,
                    placeholder: "Input nomor Telepon Merchant Anda",
                    validator: (e) => inputValidator(e, "Nomor telepon"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.done,
                    label: "Email Merchant",
                    controller: controller.form['merchantEmail']!,
                    placeholder: "Input Email Merchant Anda",
                    keyboardType: TextInputType.emailAddress,
                    validator: (e) => inputValidator(e, "Email merchant"),
                  ),
                  SizedBox(height: 40.h),
                  AppButton(
                    onPressed: controller.register,
                    text: "Buat Akun",
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
