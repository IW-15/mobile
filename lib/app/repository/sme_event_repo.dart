import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class SmeEventRepo {
  static Future<List<EventModel>> all(Map<String, dynamic> filter) async {
    try {
      final res = await fetchMultipleData<EventModel>(
        url: "/api/events",
        method: RequestMethod.PATCH,
        data: filter,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<EventModel> detail(String id) async {
    try {
      final res = await fetchData<EventModel>(
        url: "/api/events/$id",
        method: RequestMethod.PATCH,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<EventRegisteredModel> regis(
      String id, Map<String, dynamic> data) async {
    try {
      final res = await fetchData<EventRegisteredModel>(
        url: "/api/events/$id/regist",
        method: RequestMethod.POST,
        data: data,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<EventRegisteredModel>> allRegistered(
      Map<String, dynamic> filter) async {
    try {
      final res = await fetchMultipleData<EventRegisteredModel>(
        url: "/api/registered-event",
        method: RequestMethod.PATCH,
        data: filter,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<EventRegisteredModel> detailRegistered(String id) async {
    try {
      final res = await fetchData<EventRegisteredModel>(
        url: "/api/registered-event/$id",
        method: RequestMethod.PATCH,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<EventRegisteredModel> payRegistered(String id) async {
    try {
      final res = await fetchData<EventRegisteredModel>(
        url: "/api/registered-event/$id/pay",
        method: RequestMethod.POST,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
