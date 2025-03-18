import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/talangan_controller.dart';
import 'package:mobile/app/models/credit_score/credit_score_model.dart';
import 'package:mobile/app/models/loan_profile/loan_profile_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/loan_profile_repo.dart';
import 'package:mobile/app/repository/loan_repo.dart';
import 'package:mobile/routes/app_route.dart';

class LoanController extends GetxController {
  static LoanController get i => Get.find<LoanController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rxn<LoanProfileModel> loanProfile = Rxn<LoanProfileModel>();
  Rxn<CreditScoreModel> creditScore = Rxn<CreditScoreModel>();

  void getLoanProfile() async {
    try {
      var data = await LoanProfileRepo.get();
      loanProfile.value = data;
    } catch (_) {}
  }

  void getCreditScore() async {
    try {
      var data = await LoanProfileRepo.credit();
      creditScore.value = data;
    } catch (_) {}
  }

  RxMap<String, TextEditingController> form = {
    "amount": TextEditingController(),
  }.obs;

  RxnInt tenor = RxnInt();
  RxnInt amount = RxnInt();
  RxInt monthlyBill = 0.obs;

  void calculateMonthlyBill() {
    if (form['amount']!.text == "") {
      return;
    }
    if (tenor.value == null) {
      return;
    }
    monthlyBill.value =
        ((int.parse(form['amount']!.text) / tenor.value!) * 1.05).floor();
  }

  String? amountValidator(String? e) {
    if (loanProfile.value == null) {
      return "Invalid loan amount";
    }
    if (e == null || e.isEmpty) {
      return "Amount can't be empty";
    }

    var amount = int.tryParse(e);
    if (amount == null) {
      return "Amount not valid";
    }
    if (amount > loanProfile.value!.maxAmount - loanProfile.value!.limit) {
      return "Amount exceed max limit";
    }

    if (amount < loanProfile.value!.minAmount) {
      return "Amount exceed min limit";
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getLoanProfile();
    getCreditScore();
  }

  void inputAmount() {
    if (formKey.currentState!.validate()) {
      calculateMonthlyBill();
      Get.toNamed(AppRoute.loanInstallment);
    }
  }

  RxBool isLoading = false.obs;
  void submit() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      final inputForm = {
        "amount": amount.value,
        "tenor": tenor.value,
      };
      await LoanRepo.apply(inputForm);
      TalanganController.i.getCreditScore();
      TalanganController.i.getLoanProfile();

      await closeLoading(isLoading);
      Get.offNamedUntil(
        AppRoute.talangan,
        ModalRoute.withName(
          AppRoute.talangan,
        ),
      );
    } catch (err) {
      await closeLoading(isLoading);
    }
  }
}
