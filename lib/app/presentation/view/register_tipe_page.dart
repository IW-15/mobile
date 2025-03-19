import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/partials/auth/card_role_register.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/routes/app_route.dart';

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
                    CardRoleRegister(
                      icon: "assets/icons/umkm_type.svg",
                      controller: controller,
                      tipeUsaha: "UMKM",
                      description:
                          "Usahamu melibatkan jual beli barang. Kamu bisa mengikuti event yang diselenggarakan oleh Event Organizer.",
                    ),
                    SizedBox(height: 20.h),
                    CardRoleRegister(
                      icon: "assets/icons/eo_type.svg",
                      controller: controller,
                      tipeUsaha: "Event Organizer",
                      description:
                          "Usahamu melibatkan penyelenggaraan events. Kamu bisa mengundang UMKM sebagai tenant.",
                    ),
                  ],
                ),
                Expanded(child: Container()),
                AppButton(
                  onPressed: controller.tipeUsaha.value == ""
                      ? null
                      : () {
                          if (controller.tipeUsaha.value == "UMKM") {
                            controller.isUMKM.value = true;
                          } else {
                            controller.isUMKM.value = false;
                          }
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
