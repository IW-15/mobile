import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/partials/eo_event/modal_confirm_tenant.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/eo_outlet_registered_repo.dart';
import 'package:mobile/utils/get_id.dart';
import 'package:mobile/utils/show_alert.dart';

class EoRegisteredTenantsController extends GetxController {
  static EoRegisteredTenantsController get i =>
      Get.find<EoRegisteredTenantsController>();

  RxList<EventRegisteredModel> outletRegistered = <EventRegisteredModel>[].obs;
  RxList<Tenant> allTenants = <Tenant>[].obs;
  RxList<Tenant> filteredTenants = <Tenant>[].obs;

  void getAllData() async {
    try {
      outletRegistered.value = await EoOutletRegisteredRepo.allOutlets(getId());
    } catch (errro) {
      showAlert(errro.toString());
    }
  }

  RxBool isSelectAll = false.obs;

  void handleFilterAll(bool value) {
    allTenants.forEach((e) {
      e.value = value;
    });
    if (value) {
      filteredTenants.value = allTenants.map((e) => e).toList();
    } else {
      filteredTenants.value = [];
    }

    allTenants.refresh();
    filteredTenants.refresh();
    isSelectAll.value = !isSelectAll.value;
  }

  void listenFilter() {
    allTenants.listen((tenant) {
      filteredTenants.value = tenant.where((e) => e.value).toList();
      filteredTenants.refresh();
    });
  }

  @override
  void onInit() {
    super.onInit();
    outletRegistered.listen((e) {
      allTenants.value = e.map((e) => Tenant(data: e, value: false)).toList();
      filteredTenants.value = [];
      allTenants.refresh();
      filteredTenants.refresh();
    });

    listenFilter();
    getAllData();
  }

  RxBool isLoading = false.obs;

  void handleManyAccept() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      final body = {
        "outletId": filteredTenants.map((e) => e.data.outlet.id).toList()
      };

      await EoOutletRegisteredRepo.accept(getId(), body);
      getAllData();
      await closeLoading(isLoading);
      showDialog(
        context: Get.context!,
        builder: (context) => ModalConfirmTenant(
          isAccept: true,
          name: '',
        ),
      );
    } catch (_) {
      await closeLoading(isLoading);
    }
  }

  void handleManyReject() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      final body = {
        "outletId": filteredTenants.map((e) => e.data.outlet.id).toList()
      };

      await EoOutletRegisteredRepo.reject(getId(), body);
      getAllData();
      await closeLoading(isLoading);
      showDialog(
        context: Get.context!,
        builder: (context) => ModalConfirmTenant(
          isAccept: false,
          name: '',
        ),
      );
    } catch (_) {
      await closeLoading(isLoading);
    }
  }

  void handleAccept(OutletModel data) async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      final body = {
        "outletId": [data.id]
      };

      await EoOutletRegisteredRepo.accept(getId(), body);
      getAllData();
      await closeLoading(isLoading);
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) => ModalConfirmTenant(
          isAccept: true,
          name: data.name,
        ),
      );
    } catch (_) {
      await closeLoading(isLoading);
    }
  }

  void handleReject(OutletModel data) async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      final body = {
        "outletId": [data.id]
      };

      await EoOutletRegisteredRepo.reject(getId(), body);
      getAllData();
      await closeLoading(isLoading);
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) => ModalConfirmTenant(
          isAccept: false,
          name: data.name,
        ),
      );
    } catch (_) {
      await closeLoading(isLoading);
    }
  }
}

class Tenant {
  bool value;
  EventRegisteredModel data;

  Tenant({
    required this.data,
    required this.value,
  });
}
