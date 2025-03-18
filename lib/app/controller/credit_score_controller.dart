import 'package:get/get.dart';
import 'package:mobile/app/models/credit_score/credit_score_model.dart';
import 'package:mobile/app/models/loan/loan_model.dart';
import 'package:mobile/app/models/loan_profile/loan_profile_model.dart';
import 'package:mobile/app/repository/loan_profile_repo.dart';
import 'package:mobile/app/repository/loan_repo.dart';

class CreditScoreController extends GetxController {
  static CreditScoreController get i => Get.find<CreditScoreController>();

  Rxn<LoanProfileModel> loanProfile = Rxn<LoanProfileModel>();
  Rxn<CreditScoreModel> creditScore = Rxn<CreditScoreModel>();
  RxList<LoanModel> loans = RxList<LoanModel>([]);

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

  void getAllLoans() async {
    try {
      var data = await LoanRepo.all();
      loans.value = data;
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getLoanProfile();
    getCreditScore();
    getAllLoans();
  }
}
