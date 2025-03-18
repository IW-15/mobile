import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/auth_repo.dart';
import 'package:mobile/routes/app_route.dart';

class RegisterController extends GetxController {
  static RegisterController get i => Get.find<RegisterController>();
  final GlobalKey<FormState> formEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formProfileKey = GlobalKey<FormState>();

  RxString tipeUsaha = "".obs;
  RxMap<String, TextEditingController> form = {
    "phone": TextEditingController(),
    "email": TextEditingController(),
    "password": TextEditingController(),
    "password_confirmation": TextEditingController(),
    "rekening": TextEditingController(),
    "fullName": TextEditingController(),
    "firstName": TextEditingController(),
    "lastName": TextEditingController(),
    "merchantName": TextEditingController(),
    "merchantAddress": TextEditingController(),
    "merchantPhone": TextEditingController(),
    "merchantEmail": TextEditingController(),
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

  String? passwordValidator(String? e) {
    if (e == null || e.isEmpty) {
      return "Password tidak boleh kosong";
    }
    if (e.length < 8) {
      return "Password harus memiliki minimal 8 karakter";
    }
    if (!RegExp(r'[0-9]').hasMatch(e)) {
      return "Password harus mengandung setidaknya 1 angka";
    }
    if (!RegExp(r'[A-Z]').hasMatch(e)) {
      return "Password harus mengandung setidaknya 1 huruf kapital";
    }
    if (!RegExp(r'[#@\$_-]').hasMatch(e)) {
      return "Password harus mengandung setidaknya 1 karakter spesial (#, @, \$, _, -)";
    }
    return null;
  }

  String? confirmPasswordValidator(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Konfirmasi password tidak boleh kosong";
    }

    if (confirmPassword != form['password']!.text) {
      return "Konfirmasi password harus sama dengan password";
    }
    return null;
  }

  RxBool isLoading = false.obs;

  void checkPhone() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      final isValidPhone =
          await AuthRepo.checkPhone({"phone": form['phone']!.text});
      await closeLoading(isLoading);

      if (isValidPhone) {
        Get.toNamed(AppRoute.registerEmail);
      }
    } catch (err) {
      await closeLoading(isLoading);
    }
  }

  void registerEmail() async {
    if (!formEmailKey.currentState!.validate()) {
      return;
    }
    try {
      showLoadingDialog(Get.context!, isLoading);
      final isValid = await AuthRepo.checkEmail({"email": form['email']!.text});
      await closeLoading(isLoading);

      if (isValid) {
        Get.toNamed(AppRoute.registerPassword);
      }
    } catch (_) {}
  }

  void registerPassword() async {
    if (formPasswordKey.currentState!.validate()) {
      Get.toNamed(AppRoute.registerProfile);
    }
  }

  void register() async {
    if (formProfileKey.currentState!.validate()) {
      final inputForm = {
        "email": form['email']!.text,
        "phone": form['phone']!.text,
        "password": form['password']!.text,
        "password_confirmation": form['password_confirmation']!.text,
        "rekening": form['rekening']!.text,
        "fullName": form['fullName']!.text,
        "firstName": form['firstName']!.text,
        "lastName": form['lastName']!.text,
        "merchantName": form['merchantName']!.text,
        "merchantAddress": form['merchantAddress']!.text,
        "merchantPhone": form['merchantPhone']!.text,
        "merchantEmail": form['merchantEmail']!.text,
      };

      try {
        showLoadingDialog(Get.context!, isLoading);
        await AuthRepo.register(inputForm);

        await closeLoading(isLoading);
        Get.offAllNamed(AppRoute.registerSuccess);
      } catch (err) {
        await closeLoading(isLoading);
      }
    }
  }
}
