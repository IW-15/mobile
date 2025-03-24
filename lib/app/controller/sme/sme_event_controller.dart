import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/repository/outlet_repo.dart';
import 'package:mobile/app/repository/sme_event_repo.dart';

class SmeEventController extends GetxController {
  static SmeEventController get i => Get.find<SmeEventController>();

  TextEditingController inputController = TextEditingController();
  RxList<EventRegisteredModel> eventRegistered = <EventRegisteredModel>[].obs;
  RxList<EventModel> events = <EventModel>[].obs;
  RxList<OutletModel> outlets = <OutletModel>[].obs;

  List<String> categories = [
    'Bazaar',
    'Festival Makanan',
    'Konser',
    'Pameran',
  ].obs;

  final Set<String> selectedCategories = <String>{}.obs;

  Map<String, TextEditingController> formFilter = {
    "startDate": TextEditingController(),
    "endDate": TextEditingController(),
    "minSewa": TextEditingController(),
    "maxSewa": TextEditingController(),
  }.obs;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  void handleFilter(
    Set<String> category,
    String startDate,
    String endDate,
    String minSewa,
    String maxSewa,
  ) {
    formFilter['startDate']!.text = startDate;
    formFilter['endDate']!.text = endDate;
    formFilter['minSewa']!.text = minSewa;
    formFilter['maxSewa']!.text = maxSewa;
    selectedCategories.clear();
    selectedCategories.addAll(category);
    Get.back();
    getAllEvent();
  }

  void getAllRegistered() async {
    try {
      final res = await SmeEventRepo.allRegistered({});
      eventRegistered.value = res;
    } catch (_) {}
  }

  void getAllEvent() async {
    try {
      final filter = {
        "category": selectedCategories.map((e) => e).toList(),
        "minDate": formFilter['startDate']!.text,
        "maxDate": formFilter['endDate']!.text,
        "minPrice": formFilter['minSewa']!.text,
        "maxPrice": formFilter['maxSewa']!.text,
      };
      final res = await SmeEventRepo.all(filter);
      events.value = res;
    } catch (_) {}
  }

  void getAllOutlets() async {
    try {
      final res = await OutletRepo.all();
      outlets.value = res;
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getAllOutlets();
    getAllRegistered();
    getAllEvent();
  }
}
