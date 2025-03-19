import 'package:get/get.dart';
import 'package:mobile/app/controller/sme_detail_event_controller.dart';
import 'package:mobile/app/controller/sme_event_controller.dart';

class SmeEventBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmeEventController>(() => SmeEventController());
    Get.lazyPut<SmeDetailEventController>(() => SmeDetailEventController());
  }
}
