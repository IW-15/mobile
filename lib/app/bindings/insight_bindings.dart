import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/insight_controller.dart';

class InsightBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsightController>(() => InsightController());
  }
}
