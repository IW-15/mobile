import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_controller.dart';

class LoanBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanController>(() => LoanController());
  }
}
