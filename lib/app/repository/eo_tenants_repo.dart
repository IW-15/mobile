import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class EoTenantsRepo {
  static Future<List<OutletModel>> getAll(String id) async {
    try {
      final res = await fetchMultipleData<OutletModel>(
        url: "/api/eo/events/$id/tenants",
        method: RequestMethod.PATCH,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<OutletModel>> getAllNoRestrict() async {
    try {
      final res = await fetchMultipleData<OutletModel>(
        url: "/api/eo/tenants",
        method: RequestMethod.PATCH,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<OutletModel> getDetail(String eventId, String tenantId) async {
    try {
      final res = await fetchData<OutletModel>(
        url: "/api/eo/events/$eventId/tenants/$tenantId",
        method: RequestMethod.PATCH,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future invite(String eventId, String tenantId) async {
    try {
      final res = await fetchData(
        url: "/api/eo/events/$eventId/tenants/$tenantId/invite",
        method: RequestMethod.POST,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
