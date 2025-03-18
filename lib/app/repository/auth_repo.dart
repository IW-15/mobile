import 'package:mobile/app/models/user/user_model.dart';
import 'package:mobile/app/services/api/fetch_data.dart';
import 'package:mobile/app/services/api/request_method.dart';

class AuthRepo {
  static Future<bool> checkPhone(Map<String, String> data) async {
    try {
      await fetchData(
        url: "/api/auth/phone",
        method: RequestMethod.POST,
        data: data,
      );

      return true;
    } catch (err) {
      return false;
    }
  }

  static Future<bool> checkEmail(Map<String, String> data) async {
    try {
      await fetchData(
        url: "/api/auth/email",
        method: RequestMethod.POST,
        data: data,
      );

      return true;
    } catch (err) {
      return false;
    }
  }

  static Future<UserModel> register(Map<String, String> data) async {
    try {
      var res = await fetchData<UserModel>(
        url: "/api/auth/signup",
        method: RequestMethod.POST,
        data: data,
      );

      return res.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<String> login(Map<String, String> data) async {
    try {
      var res = await fetchData(
        url: "/api/auth/signin",
        method: RequestMethod.POST,
        data: data,
      );

      return res.data['token'];
    } catch (err) {
      rethrow;
    }
  }
}
