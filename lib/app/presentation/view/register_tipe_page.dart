import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterTipePage extends GetView<RegisterController> {
  const RegisterTipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: "Pilih Tipe Usaha",
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.tipeUsaha.value = "Perseorangan";
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.tipeUsaha.value == 'Perseorangan'
                              ? ColorConstants.primary[50]
                              : Colors.white,
                          border: controller.tipeUsaha.value == 'Perseorangan'
                              ? Border.all(color: ColorConstants.primary[500]!)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            ColorConstants.shadow[1]!,
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              color:
                                  controller.tipeUsaha.value == 'Perseorangan'
                                      ? ColorConstants.primary[500]
                                      : Colors.grey,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Perseorangan',
                              style: body4BTextStyle(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Usahamu tidak memiliki badan hukum dan rekening atas nama usaha.',
                              style: body5TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        controller.tipeUsaha.value = "Badan Usaha";
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: controller.tipeUsaha.value == 'Badan Usaha'
                                ? ColorConstants.primary[50]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              ColorConstants.shadow[1]!,
                            ],
                            border: controller.tipeUsaha.value == 'Badan Usaha'
                                ? Border.all(
                                    color: ColorConstants.primary[500]!)
                                : null),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.business,
                              color: controller.tipeUsaha.value == 'Badan Usaha'
                                  ? ColorConstants.primary[500]
                                  : Colors.grey,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Badan Usaha',
                              style: body4BTextStyle(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Hanya untuk usaha yang sudah terdaftar sebagai pengguna Merchant EDC Badan Usaha Bank Mandiri.',
                              style: body5TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                AppButton(
                  onPressed: controller.tipeUsaha.value == ""
                      ? null
                      : () {
                          Get.toNamed(AppRoute.registerRekening);
                        },
                  text: "Konfirmasi",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
