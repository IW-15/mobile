import 'package:get/get.dart';
import 'package:mobile/app/controller/talangan_controller.dart';

class TalanganBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TalanganController>(() => TalanganController());
  }
}
