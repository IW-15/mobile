import 'package:get/get.dart';
import 'package:mobile/app/models/event_invitation/event_invitation_model.dart';
import 'package:mobile/app/repository/invitation_repo.dart';

class InvitationController extends GetxController {
  static InvitationController get i => Get.find<InvitationController>();
  RxList<EventInvitationModel> invitations = <EventInvitationModel>[].obs;

  void getInvitations() async {
    try {
      invitations.value = await InvitationRepo.all();
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getInvitations();
  }
}
