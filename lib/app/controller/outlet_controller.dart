import 'package:get/get.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/repository/outlet_repo.dart';
import 'package:mobile/app/controller/global_controller.dart';

class OutletController extends GetxController {
  static OutletController get i => Get.find<OutletController>();

  RxList<OutletModel> outlets = RxList<OutletModel>([]);
  void getAllOutlets() async {
    try {
      var res = await OutletRepo.all();
      outlets.value = res;
    } catch (_) {}
  }

  void getRevenueType() async {
    try {
      var data = await OutletRepo.revenue();
      GlobalController.i.revenue.value = data;
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getAllOutlets();
    getRevenueType();
  }
}
