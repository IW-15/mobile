import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/home_controller.dart';
import 'package:mobile/app/presentation/partials/settings/card_profile.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class SettingPage extends GetView<HomeController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(route: AppRoute.setting),
      body: TalanganScaffold(
        title: "Settings",
        leading: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardProfile(),
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
                    path: AppRoute.outlet,
                    name: "Outlet",
                    desc: "Atur informasi outlet usahamu",
                  ),
                  element(
                    name: "Pegawai",
                    desc: "Pengaturan seputar pegawaimu",
                  ),
                  element(
                    name: "Metode pesanan",
                    desc: "Lorem ipsum dolor sit amet",
                  ),
                  element(
                    name: "Lorem Ipsum",
                    desc: "Lorem ipsum dolor sit amet",
                    end: true,
                  ),
                ],
              ),
            )
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
