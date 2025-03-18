import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/detail_outlet_controller.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/presentation/partials/outlet/card_merchant.dart';
import 'package:mobile/app/presentation/partials/outlet/card_store.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_modal.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/get_id.dart';

class DetailOutletPage extends GetView<DetailOutletController> {
  const DetailOutletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Detail Outlet",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => controller.data.value == null
                  ? Container()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CardStore(data: controller.data.value!),
                        SizedBox(height: 24.h),
                        GlobalController.i.merchant.value != null
                            ? CardMerchant(
                                data: GlobalController.i.merchant.value!)
                            : Container(),
                      ],
                    ),
            ),
            Expanded(child: Container()),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.editOutlet(getId()));
                      },
                      text: "Edit"),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AppModal(
                              primaryText: "Hapus",
                              description:
                                  "Pastikan datanya sudah benar dan sesuai demi kelancaran proses pendaftaran. Jika ada yang salah, hubungi Call Center 14021 atau agen kantor Cabang Bank Mandiri.",
                              secondaryText: "Kembali",
                              onPrimary: controller.delete,
                              onSecondary: () {
                                Get.back();
                              },
                              title: "Hapus Outlet",
                            );
                          });
                    },
                    text: "Hapus",
                    variant: AppButtonVariant.secondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
