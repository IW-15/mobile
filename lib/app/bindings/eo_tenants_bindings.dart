import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_available_tenants_controller.dart';
import 'package:mobile/app/controller/eo/eo_registered_tenants_controller.dart';

class EoTenantsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EoAvailableTenantsController>(
      () => EoAvailableTenantsController(),
    );
    Get.lazyPut<EoRegisteredTenantsController>(
      () => EoRegisteredTenantsController(),
    );
  }
}
