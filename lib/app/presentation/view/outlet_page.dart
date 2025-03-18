import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/outlet_controller.dart';
import 'package:mobile/app/presentation/partials/outlet/card_outlet.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class OutletPage extends GetView<OutletController> {
  const OutletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(route: AppRoute.setting),
      body: TalanganScaffold(
        title: "Outlet",
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.h),
              Text(
                "Kelola Outlet",
                style: h4BTextStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                "Pilih usaha yang ingin Anda perbarui",
                style: body5TextStyle(
                  color: ColorConstants.slate[500],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              ...controller.outlets.map(
                (e) => CardOutlet(data: e),
              ),
              Expanded(child: Container()),
              SizedBox(height: 24.h),
              AppButton(
                onPressed: () {
                  Get.toNamed(AppRoute.createOutlet);
                },
                text: "Tambah Outlet Baru",
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
