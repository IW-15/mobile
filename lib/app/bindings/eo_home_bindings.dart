import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_home_controller.dart';

class EoHomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EoHomeController>(() => EoHomeController());
  }
}
