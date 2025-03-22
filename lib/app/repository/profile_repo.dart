import 'package:mobile/app/models/profile/eo_profile_model.dart';
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

  static Future<EoProfileModel> eoProfile() async {
    try {
      final res = await fetchData<EoProfileModel>(
        url: "/api/eo/profile",
        method: RequestMethod.PATCH,
      );
      return res.data!;
    } catch (_) {
      rethrow;
    }
  }
}
