import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_banding_controller.dart';
import 'package:mobile/app/controller/loan_finish_controller.dart';
import 'package:mobile/app/controller/loan_onboard_controller.dart';

class LoanOnboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanOnboardController>(() => LoanOnboardController());
    Get.lazyPut<LoanFinishController>(() => LoanFinishController());
    Get.lazyPut<LoanBandingController>(() => LoanBandingController());
  }
}
