import 'package:get/get.dart';
import 'package:mobile/app/controller/cashflow_controller.dart';

class CashflowBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CashflowController>(CashflowController());
  }
}
