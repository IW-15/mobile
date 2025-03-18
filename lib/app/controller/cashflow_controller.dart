import 'package:get/get.dart';
import 'package:mobile/app/models/cashflow/cashflow_model.dart';
import 'package:mobile/app/repository/cashflow_repo.dart';

class CashflowController extends GetxController {
  static CashflowController get i => Get.find<CashflowController>();

  Rxn<CashflowModel> cashflow = Rxn<CashflowModel>();
  void getCashflowData() async {
    try {
      var data = await CashflowRepo.all();
      cashflow.value = data;
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    getCashflowData();
  }
}
