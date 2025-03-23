import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_cashflow_controller.dart';

class EoCashflowBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EoCashflowController>(() => EoCashflowController());
  }
}
