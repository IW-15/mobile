import 'package:mobile/app/models/credit_score/credit_score_model.dart';
import 'package:mobile/app/models/loan_profile/loan_profile_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class LoanProfileRepo {
  static Future<LoanProfileModel> get() async {
    try {
      final res = await fetchData<LoanProfileModel>(
        url: "/api/loan-profile",
        method: RequestMethod.GET,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<CreditScoreModel> credit() async {
    try {
      final res = await fetchData<CreditScoreModel>(
        url: "/api/credit-score",
        method: RequestMethod.GET,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
