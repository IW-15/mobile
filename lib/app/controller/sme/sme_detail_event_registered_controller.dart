import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_event_controller.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/sme_event_repo.dart';
import 'package:mobile/global_settings.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/get_id.dart';
import 'package:mobile/utils/show_alert.dart';

class SmeDetailEventRegisteredController extends GetxController {
  static SmeDetailEventRegisteredController get i =>
      Get.find<SmeDetailEventRegisteredController>();

  Rxn<EventRegisteredModel> data = Rxn<EventRegisteredModel>();
  RxString passcodePayment = "".obs;

  void getData() async {
    try {
      final res = await SmeEventRepo.detailRegistered(getId());
      data.value = res;
    } catch (err) {
      print(err);
      showAlert('asdasasd');
    }
  }

  void handleSubmit() {
    if (data.value == null) {
      return;
    }
    if (data.value!.status == "waiting") {
      Get.toNamed(AppRoute.eventInvoice(data.value!.id.toString()));
      return;
    }
  }

  RxBool isLoading = false.obs;
  void handlePayment() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await SmeEventRepo.payRegistered(getId());
      SmeEventController.i.getAllEvent();
      await closeLoading(isLoading);
      Get.offNamedUntil(
        AppRoute.eventSuccess,
        ModalRoute.withName(AppRoute.smeEvent),
      );
    } catch (_) {
      await closeLoading(isLoading);
    }
  }

  void handleInsight() {
    print("JASDASDASD");
    if (Global.isInsight) {
      Get.toNamed(AppRoute.insight);
    } else {
      Get.toNamed(AppRoute.insightOnboard);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
