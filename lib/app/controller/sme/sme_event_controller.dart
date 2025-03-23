import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/repository/sme_event_repo.dart';

class SmeEventController extends GetxController {
  static SmeEventController get i => Get.find<SmeEventController>();

  TextEditingController inputController = TextEditingController();
  RxList<EventRegisteredModel> eventRegistered = <EventRegisteredModel>[].obs;
  RxList<EventModel> events = <EventModel>[].obs;

  void getAllRegistered() async {
    try {
      final res = await SmeEventRepo.allRegistered({});
      eventRegistered.value = res;
    } catch (_) {}
  }

  void getAllEvent() async {
    try {
      final res = await SmeEventRepo.all({});
      events.value = res;
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getAllRegistered();
    getAllEvent();
  }
}
