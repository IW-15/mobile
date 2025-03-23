import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class EoOutletRegisteredRepo {
  static Future<List<EventRegisteredModel>> allOutlets(String id) async {
    try {
      final res = await fetchMultipleData<EventRegisteredModel>(
        url: "/api/eo/events/$id/outlet-registered",
        method: RequestMethod.PATCH,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future accept(String id, Map<String, dynamic> data) async {
    try {
      final res = await fetchData(
        url: "/api/eo/events/$id/outlet-registered/accept",
        method: RequestMethod.POST,
        data: data,
      );

      return res.data;
    } catch (_) {
      rethrow;
    }
  }

  static Future reject(String id, Map<String, dynamic> data) async {
    try {
      final res = await fetchData(
        url: "/api/eo/events/$id/outlet-registered/reject",
        method: RequestMethod.POST,
        data: data,
      );

      return res.data;
    } catch (_) {
      rethrow;
    }
  }
}
