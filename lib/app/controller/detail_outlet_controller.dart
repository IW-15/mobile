import 'package:get/get.dart';
import 'package:mobile/app/controller/outlet_controller.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/outlet_repo.dart';
import 'package:mobile/utils/get_id.dart';
import 'package:mobile/utils/show_alert.dart';

class DetailOutletController extends GetxController {
  static DetailOutletController get i => Get.find<DetailOutletController>();

  Rxn<OutletModel> data = Rxn<OutletModel>();
  void getOutletData() async {
    try {
      var res = await OutletRepo.get(getId());
      data.value = res;
    } catch (_) {}
  }

  RxBool isLoading = false.obs;

  void delete() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await OutletRepo.delete(getId());
      showAlert(
        "Success delete outlet data",
        isSuccess: true,
      );
      OutletController.i.getAllOutlets();

      await closeLoading(isLoading);
      Get.back();
      Get.back();
      Get.back();
      Get.back();
    } catch (err) {
      await closeLoading(isLoading);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getOutletData();
  }
}
