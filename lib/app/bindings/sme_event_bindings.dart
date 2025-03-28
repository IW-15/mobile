import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_controller.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_registered_controller.dart';
import 'package:mobile/app/controller/sme/sme_event_controller.dart';

class SmeEventBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmeEventController>(() => SmeEventController());
    Get.lazyPut<SmeDetailEventController>(() => SmeDetailEventController());
    Get.lazyPut<SmeDetailEventRegisteredController>(
        () => SmeDetailEventRegisteredController());
  }
}
