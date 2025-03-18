import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/credit_score_controller.dart';
import 'package:mobile/app/models/loan/loan_model.dart';
import 'package:mobile/app/models/repayment/repayment_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/loan_repo.dart';
import 'package:mobile/app/repository/repayment_repo.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/get_id.dart';

class LoanDetailController extends GetxController {
  static LoanDetailController get i => Get.find<LoanDetailController>();
  Rxn<LoanModel> loanData = Rxn<LoanModel>();
  RxList<RepaymentModel> repayments = RxList<RepaymentModel>();

  void getLoanData() async {
    try {
      var res = await LoanRepo.detail(getId());
      loanData.value = res;
    } catch (_) {}
  }

  void getRepaymentData() async {
    try {
      var res = await RepaymentRepo.all(getId());
      repayments.value = res;
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getLoanData();
    getRepaymentData();
  }

  RxBool isLoading = false.obs;
  void submitRepayment() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await RepaymentRepo.pay(getId());
      CreditScoreController.i.getAllLoans();

      await closeLoading(isLoading);
      Get.offNamedUntil(
        AppRoute.repaymentSuccess(getId()),
        ModalRoute.withName(AppRoute.creditScore),
      );
    } catch (_) {
      await closeLoading(isLoading);
    }
  }
}
