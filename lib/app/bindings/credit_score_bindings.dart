import 'package:get/get.dart';
import 'package:mobile/app/controller/credit_score_controller.dart';
import 'package:mobile/app/controller/loan_detail_controller.dart';

class CreditScoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditScoreController>(() => CreditScoreController());
    Get.lazyPut<LoanDetailController>(() => LoanDetailController());
  }
}
