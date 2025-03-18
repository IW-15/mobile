import 'package:mobile/app/models/profile/profile_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class ProfileRepo {
  static Future<ProfileModel> profile() async {
    try {
      final res = await fetchData<ProfileModel>(
        url: "/api/profile",
        method: RequestMethod.GET,
      );

      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
