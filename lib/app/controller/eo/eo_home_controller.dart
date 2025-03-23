import 'package:get/get.dart';
import 'package:mobile/app/models/eo/eo_model.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/models/user/user_model.dart';
import 'package:mobile/app/repository/eo_event_repo.dart';
import 'package:mobile/app/repository/profile_repo.dart';
import 'package:mobile/app/controller/global_controller.dart';

class EoHomeController extends GetxController {
  static EoHomeController get i => Get.find<EoHomeController>();

  Rxn<UserModel> user = Rxn<UserModel>();
  Rxn<EoModel> eo = Rxn<EoModel>();
  RxBool fnb = false.obs;
  RxList<EventModel> event = RxList<EventModel>();

  void getProfileData() async {
    try {
      var data = await ProfileRepo.eoProfile();
      GlobalController.i.user.value = data.user;
      GlobalController.i.eo.value = data.eo;
      user.value = data.user;
      eo.value = data.eo;
    } catch (_) {}
  }

  void getEventData() async {
    try {
      event.value = await EoEventRepo.getALlNoGroup();
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getProfileData();
    getEventData();
  }
}
