import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/app/models/merchant_verify/merchant_verify_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class MerchantRepo {
  static Future<MerchantModel> get() async {
    try {
      final res = await fetchData<MerchantModel>(
        url: "/api/merchant",
        method: RequestMethod.GET,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<MerchantVerifyModel> verify() async {
    try {
      final res = await fetchData<MerchantVerifyModel>(
        url: "/api/merchant/verify",
        method: RequestMethod.POST,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
