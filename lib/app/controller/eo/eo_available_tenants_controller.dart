import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/partials/eo_event/modal_invited.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/eo_tenants_repo.dart';
import 'package:mobile/utils/get_id.dart';

class EoAvailableTenantsController extends GetxController {
  static EoAvailableTenantsController get i =>
      Get.find<EoAvailableTenantsController>();

  RxList<OutletModel> outlets = RxList<OutletModel>();
  RxMap<String, OutletModel> outletDetail = <String, OutletModel>{}.obs;

  void getAvailableOutlet() async {
    try {
      if (getId() == ":id") {
        outlets.value = await EoTenantsRepo.getAllNoRestrict();
      } else {
        outlets.value = await EoTenantsRepo.getAll(getId());
      }
    } catch (_) {}
  }

  RxBool isLoading = false.obs;

  void handleInvite(String id) async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await EoTenantsRepo.invite(getId(), id);
      getAvailableOutlet();
      await closeLoading(isLoading);
      Get.back();

      showDialog(
        context: Get.context!,
        builder: (context) => ModalInvited(),
      );
    } catch (_) {
      await closeLoading(isLoading);
      Get.back();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAvailableOutlet();
  }
}
