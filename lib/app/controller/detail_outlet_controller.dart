import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/outlet_controller.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/presentation/widgets/app_modal.dart';
import 'package:mobile/app/repository/outlet_repo.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/get_id.dart';
import 'package:mobile/utils/show_alert.dart';

class DetailOutletController extends GetxController {
  static DetailOutletController get i => Get.find<DetailOutletController>();

  Rxn<OutletModel> data = Rxn<OutletModel>();
  void getOutletData() async {
    try {
      var res = await OutletRepo.get(getId());
      data.value = res;
    } catch (_) {}
  }

  RxBool isLoading = false.obs;

  void delete() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AppModal(
            primaryText: "Hapus",
            description:
                "Pastikan datanya sudah benar dan sesuai demi kelancaran proses pendaftaran. Jika ada yang salah, hubungi Call Center 14021 atau agen kantor Cabang Bank Mandiri.",
            secondaryText: "Kembali",
            onPrimary: () async {
              try {
                showLoadingDialog(Get.context!, isLoading);
                await OutletRepo.delete(getId());
                showAlert(
                  "Success delete outlet data",
                  isSuccess: true,
                );
                OutletController.i.getAllOutlets();

                await closeLoading(isLoading);
                Get.until(ModalRoute.withName(AppRoute.outlet));
              } catch (err) {
                await closeLoading(isLoading);
              }
            },
            onSecondary: () {
              Get.back();
            },
            title: "Hapus Outlet",
          );
        });
  }

  void handleToggleEvent(bool _) async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await OutletRepo.toggle(getId());
      getOutletData();
      OutletController.i.getAllOutlets();
      await closeLoading(isLoading);
    } catch (err) {
      showAlert(err.toString());
      await closeLoading(isLoading);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getOutletData();
  }
}
