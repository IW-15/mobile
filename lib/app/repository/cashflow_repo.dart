import 'package:mobile/app/models/cashflow/cashflow_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class CashflowRepo {
  static Future<CashflowModel> all() async {
    try {
      final res = await fetchData<CashflowModel>(
        url: "/api/transaction",
        method: RequestMethod.GET,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
