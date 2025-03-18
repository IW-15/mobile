import 'package:mobile/app/models/repayment/repayment_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class RepaymentRepo {
  static Future<List<RepaymentModel>> all(String loanId) async {
    try {
      final res = await fetchMultipleData<RepaymentModel>(
        url: "/api/loan/$loanId/repayment",
        method: RequestMethod.GET,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future pay(String loanId) async {
    try {
      await fetchData(
        url: "/api/loan/$loanId/repayment/pay",
        method: RequestMethod.POST,
      );
    } catch (_) {
      rethrow;
    }
  }
}
