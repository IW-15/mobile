import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_home_controller.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/repository/eo_event_repo.dart';

class EoEventController extends GetxController {
  static EoEventController get i => Get.find<EoEventController>();

  RxMap<String, String> filter = {
    "filter": "all",
    "date": "desc",
  }.obs;

  RxMap<String, List<EventModel>> events = <String, List<EventModel>>{}.obs;

  void getAllEvent() async {
    try {
      final res = await EoEventRepo.getALl(filter);
      events.value = res.events!;
      EoHomeController.i.getEventData();
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    filter.listen((p0) {
      getAllEvent();
    });

    getAllEvent();
  }
}
