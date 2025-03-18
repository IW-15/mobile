import 'package:get/get.dart';
import 'package:mobile/app/controller/landing_controller.dart';
import 'package:mobile/app/controller/login_controller.dart';
import 'package:mobile/app/controller/register_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
