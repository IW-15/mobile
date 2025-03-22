import 'package:dio/dio.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/models/event/event_response.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class EoEventRepo {
  static Future<EventsResponse> getALl(
      [Map<String, dynamic> filter = const {}]) async {
    try {
      final res = await fetchData<EventsResponse>(
        url: "/api/eo/events",
        method: RequestMethod.PATCH,
        data: filter,
      );

      return res.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<EventModel> create(FormData data) async {
    try {
      final res = await fetchData<EventModel>(
        url: "/api/eo/events",
        method: RequestMethod.POST,
        data: data,
      );

      return res.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<EventModel> getDetail(String id) async {
    try {
      final res = await fetchData<EventModel>(
        url: "/api/eo/events/$id",
        method: RequestMethod.PATCH,
      );

      return res.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<EventModel> delete(String id) async {
    try {
      final res = await fetchData<EventModel>(
        url: "/api/eo/events/$id",
        method: RequestMethod.DELETE,
      );

      return res.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<EventModel> publish(String id) async {
    try {
      final res = await fetchData<EventModel>(
        url: "/api/eo/events/$id/publish",
        method: RequestMethod.POST,
      );

      return res.data!;
    } catch (err) {
      rethrow;
    }
  }
}
