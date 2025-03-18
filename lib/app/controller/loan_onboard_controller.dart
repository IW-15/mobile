import 'dart:io';

import 'package:get/get.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/outlet_repo.dart';
import 'package:mobile/routes/app_route.dart';

class LoanOnboardController extends GetxController {
  static LoanOnboardController get i => Get.find<LoanOnboardController>();

  RxList<OutletModel> outlets = RxList<OutletModel>([]);
  void getAllOutlets() async {
    try {
      var res = await OutletRepo.all();
      outlets.value = res;
    } catch (_) {}
  }

  RxnInt selectedOutlet = RxnInt();

  RxBool sk = false.obs;

  Rxn<File> ktp = Rxn<File>();
  Rxn<File> kk = Rxn<File>();
  Rxn<File> suratNikah = Rxn<File>();
  Rxn<File> suratKeterangan = Rxn<File>();
  Rxn<File> npwp = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    getAllOutlets();
  }

  bool checkValid() {
    return (ktp.value != null) &&
        kk.value != null &&
        suratNikah.value != null &&
        suratKeterangan.value != null &&
        npwp.value != null &&
        selectedOutlet.value != null;
  }

  RxBool isLoading = false.obs;

  void submitFile() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await Future.delayed(Duration(seconds: 2));
      await closeLoading(isLoading);
      Get.toNamed(AppRoute.loanFinish);
    } catch (_) {
      await closeLoading(isLoading);
    }
  }
}
