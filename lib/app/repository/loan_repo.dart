import 'package:mobile/app/models/loan/loan_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class LoanRepo {
  static Future apply(Map<String, dynamic> data) async {
    try {
      await fetchData(
        url: "/api/loan/apply",
        method: RequestMethod.POST,
        data: data,
      );
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<LoanModel>> all() async {
    try {
      final res = await fetchMultipleData<LoanModel>(
        url: "/api/loan",
        method: RequestMethod.GET,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<LoanModel> detail(String id) async {
    try {
      final res = await fetchData<LoanModel>(
        url: "/api/loan/$id",
        method: RequestMethod.GET,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
