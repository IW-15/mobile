import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_event_controller.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/presentation/partials/event/card_survey_sme.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/sme_event_repo.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/get_id.dart';

class SmeDetailEventController extends GetxController {
  static SmeDetailEventController get i => Get.find<SmeDetailEventController>();
  RxString passcodePayment = "".obs;
  Rxn<EventModel> data = Rxn<EventModel>();

  void getData() async {
    try {
      final res = await SmeEventRepo.detail(getId());
      data.value = res;
    } catch (_) {}
  }

  RxnInt selectedOutlet = RxnInt();
  RxBool isLoading = false.obs;

  void handleConfirm() async {
    try {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) => CardSurveySme(),
      );
    } catch (_) {}
  }

  void handleRegis() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      final form = {"outletId": selectedOutlet.value};
      await SmeEventRepo.regis(data.value!.id.toString(), form);
      await closeLoading(isLoading);
      SmeEventController.i.getAllRegistered();
      Get.offNamedUntil(
        AppRoute.eventRegistered,
        ModalRoute.withName(AppRoute.eventSearch),
      );
    } catch (_) {
      await closeLoading(isLoading);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
