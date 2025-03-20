import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_detail_event_controller.dart';
import 'package:mobile/app/controller/eo/eo_event_controller.dart';
import 'package:mobile/app/controller/eo/eo_event_map_controller.dart';

class EoEventBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EoDetailEventController>(() => EoDetailEventController());
    Get.lazyPut<EoEventController>(() => EoEventController());
    Get.lazyPut<EoEventMapController>(() => EoEventMapController());
  }
}
