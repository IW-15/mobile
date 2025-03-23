import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_home_controller.dart';
import 'package:mobile/app/presentation/partials/settings/card_profile.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class EoSettingPage extends GetView<EoHomeController> {
  const EoSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        route: AppRoute.eoSetting,
        isSme: false,
      ),
      body: TalanganScaffold(
        title: "Settings",
        leading: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => CardProfile(
                  name: controller.eo.value?.name ?? "",
                  storeName: controller.eo.value?.pic ?? "",
                  storeAddress: controller.eo.value?.address ?? ""),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.settings_outlined,
                    size: 28.w,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Mode F&B",
                          style: body5BTextStyle(),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Mode untuk kelola restoran",
                          style: body5TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Switch(
                      value: controller.fnb.value,
                      onChanged: (e) {
                        controller.fnb.value = e;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "Pengaturan Usaha",
              style: h4BTextStyle(),
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.w),
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              child: Column(
                children: [
                  element(
                    name: "Bahasa",
                    desc: "Atur bahasa utama aplikasimu",
                  ),
                  element(
                    name: "Pegawai",
                    desc: "Pengaturan seputar pegawaimu",
                  ),
                  element(
                    name: "Customer Service",
                    desc: "Tanyakan ke pihak CS apabila ada kendala",
                  ),
                  element(
                    name: "FAQ",
                    desc: "Lihat pertanyaan yang sering diajukan",
                    end: true,
                  ),
                  element(
                    name: "About",
                    desc: "Lorem ipsum dolor sit amet",
                    end: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            AppButton(
              onPressed: logoutHandler,
              text: "Logout",
              color: ColorConstants.error,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget element({
    String? path,
    String name = "",
    String desc = "",
    IconData icon = Icons.settings_outlined,
    bool end = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (path == null) {
          return;
        }
        Get.toNamed(path);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          border: !end
              ? Border(
                  bottom: BorderSide(color: ColorConstants.slate[200]!),
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28.w,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    name,
                    style: body5BTextStyle(),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    desc,
                    style: body5TextStyle(),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 28.w,
            ),
          ],
        ),
      ),
    );
  }
}
