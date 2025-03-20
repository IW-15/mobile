import 'package:get/get.dart';

class EoEventController extends GetxController {
  static EoEventController get i => Get.find<EoEventController>();

  RxString filter = "all".obs;
}
