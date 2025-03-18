import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/auth_repo.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/app_token.dart';
import 'package:mobile/utils/show_alert.dart';

class LoginController extends GetxController {
  static LoginController get i => Get.find<LoginController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxMap<String, TextEditingController> form = {
    "phone": TextEditingController(),
    "password": TextEditingController(),
  }.obs;

  String? emailValidator(e) {
    if (e == null || e!.isEmpty) {
      return "Email can't be empty";
    }

    if (!(e as String).isEmail) {
      return "Email invalid";
    }
    return null;
  }

  RxBool isLoading = false.obs;
  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog(Get.context!, isLoading);
        final inputForm = {
          "phone": form['phone']!.text.trim(),
          "password": form['password']!.text.trim(),
        };
        var token = await AuthRepo.login(inputForm);
        UserToken.setToken(token);
        showAlert("Login succeed", isSuccess: true);
        await closeLoading(isLoading);

        Get.offAllNamed(AppRoute.home);
      } catch (error) {
        await closeLoading(isLoading);
      }
    }
  }
}
