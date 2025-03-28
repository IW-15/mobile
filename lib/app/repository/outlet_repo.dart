import 'package:dio/dio.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/models/outlet_revenue/outlet_revenue_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class OutletRepo {
  static Future<List<OutletModel>> all() async {
    try {
      final res = await fetchMultipleData<OutletModel>(
        url: "/api/outlet",
        method: RequestMethod.GET,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<OutletModel> get(String id) async {
    try {
      final res = await fetchData<OutletModel>(
        url: "/api/outlet/$id",
        method: RequestMethod.GET,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<OutletModel> create(FormData data) async {
    try {
      final res = await fetchData<OutletModel>(
        url: "/api/outlet",
        method: RequestMethod.POST,
        data: data,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<OutletModel> edit(String id, FormData data) async {
    try {
      final res = await fetchData<OutletModel>(
        url: "/api/outlet/$id/update",
        method: RequestMethod.POST,
        data: data,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future delete(String id) async {
    try {
      await fetchData(
        url: "/api/outlet/$id",
        method: RequestMethod.DELETE,
      );
    } catch (_) {
      rethrow;
    }
  }

  static Future toggle(String id) async {
    try {
      await fetchData(
        url: "/api/outlet/$id/toggle-invitation",
        method: RequestMethod.POST,
      );
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<OutletRevenueModel>> revenue() async {
    try {
      final res = await fetchMultipleData<OutletRevenueModel>(
        url: "/api/outlet/revenue",
        method: RequestMethod.GET,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
