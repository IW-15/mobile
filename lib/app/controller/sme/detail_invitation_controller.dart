import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/invitation_controller.dart';
import 'package:mobile/app/controller/sme/sme_event_controller.dart';
import 'package:mobile/app/models/event_invitation/event_invitation_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/invitation_repo.dart';
import 'package:mobile/utils/get_id.dart';

class DetailInvitationController extends GetxController {
  static DetailInvitationController get i =>
      Get.find<DetailInvitationController>();
  Rxn<EventInvitationModel> invitationData = Rxn<EventInvitationModel>();

  void getInvitation() async {
    try {
      invitationData.value = await InvitationRepo.detail(getId());
    } catch (_) {}
  }

  RxBool isLoading = false.obs;
  void handleAccept() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await InvitationRepo.accept(getId());
      SmeEventController.i.getAllRegistered();
      InvitationController.i.getInvitations();
      await closeLoading(isLoading);
      Get.back();
    } catch (_) {
      await closeLoading(isLoading);
    }
  }

  void handleReject() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await InvitationRepo.accept(getId());
      InvitationController.i.getInvitations();
      SmeEventController.i.getAllRegistered();
      await closeLoading(isLoading);
      Get.back();
    } catch (_) {
      await closeLoading(isLoading);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getInvitation();
  }
}
