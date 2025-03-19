import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/app_input_file.dart';
import 'package:mobile/app/presentation/widgets/register_progress.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/input_validator.dart';

class RegisterEoPage extends GetView<RegisterController> {
  const RegisterEoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableConstraints(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: controller.formEoKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        "5/5: ",
                        style: h5BTextStyle(
                          color: ColorConstants.slate[400],
                        ),
                      ),
                      Text(
                        " Pengisian Data Usaha",
                        style: h5BTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RegisterProgress(currentStep: 5),
                  SizedBox(height: 20.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    controller: controller.formEo['name']!,
                    label: "Nama Perusahaan",
                    placeholder: "Input Nama Perusahaan",
                    validator: (e) => inputValidator(e, "Nama perusahaan"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    controller: controller.formEo['nib']!,
                    label: "Nomor Induk Berusaha (NIB)",
                    placeholder: "Input NIB",
                    keyboardType: TextInputType.number,
                    validator: (e) => inputValidator(e, "NIB"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    controller: controller.formEo['pic']!,
                    label: "Nama PIC",
                    textInputAction: TextInputAction.next,
                    placeholder: "Input Nama PIC",
                    validator: (e) => inputValidator(e, "Nama PIC"),
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    controller: controller.formEo['picPhone']!,
                    textInputAction: TextInputAction.next,
                    label: "Nomor Telepon PIC",
                    placeholder: "Input Nomor Telepon",
                    keyboardType: TextInputType.phone,
                    prefixIcon: Center(
                      child: Text(
                        " +62",
                        style: body4TextStyle(),
                      ),
                    ),
                    validator: validatePhoneNumber,
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    controller: controller.formEo['email']!,
                    label: "Alamat Email Perusahaan",
                    placeholder: "Input email perusahaan",
                    textInputAction: TextInputAction.next,
                    validator: emailValidator,
                  ),
                  SizedBox(height: 12.h),
                  AppInput(
                    textInputAction: TextInputAction.next,
                    controller: controller.formEo['address']!,
                    label: "Alamat Kantor",
                    placeholder: "Input Alamat Kantor",
                    maxLines: 6,
                    validator: (e) => inputValidator(e, "Alamat kantor"),
                  ),
                  SizedBox(height: 12.h),
                  Obx(
                    () => AppInputFile(
                      extensions: ["pdf", "jpg", "png"],
                      file: controller.eoDocument.value,
                      onChange: (e) {
                        controller.eoDocument.value = e;
                      },
                      onRemove: () {
                        controller.eoDocument.value = null;
                      },
                      label: "Surat Izin Usaha (PDF)",
                      error: "Surat Izin Usaha tidak boleh kosong",
                      hint: "Format PDF, max: 10MB",
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(height: 20.h),
                  AppButton(
                    onPressed: controller.eoFillForm,
                    text: "Konfirmasi",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
