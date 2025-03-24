import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/detail_invitation_controller.dart';
import 'package:mobile/app/controller/sme/invitation_controller.dart';

class InvitationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvitationController>(() => InvitationController());
    Get.lazyPut<DetailInvitationController>(() => DetailInvitationController());
  }
}
