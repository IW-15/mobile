import 'package:mobile/app/models/event_invitation/event_invitation_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class InvitationRepo {
  static Future<List<EventInvitationModel>> all() async {
    try {
      final res = await fetchMultipleData<EventInvitationModel>(
        url: "/api/invitation",
        method: RequestMethod.PATCH,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<EventInvitationModel> detail(String id) async {
    try {
      final res = await fetchData<EventInvitationModel>(
        url: "/api/invitation/$id",
        method: RequestMethod.PATCH,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<EventInvitationModel> accept(String id) async {
    try {
      final res = await fetchData<EventInvitationModel>(
        url: "/api/invitation/$id/accept",
        method: RequestMethod.POST,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<EventInvitationModel> reject(String id) async {
    try {
      final res = await fetchData<EventInvitationModel>(
        url: "/api/invitation/$id/reject",
        method: RequestMethod.POST,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
