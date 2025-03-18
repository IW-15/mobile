import 'package:get/get.dart';
import 'package:mobile/app/controller/home_controller.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/merchant_repo.dart';
import 'package:mobile/routes/app_route.dart';

class LoanFinishController extends GetxController {
  RxBool isFinish = false.obs;

  void calculateFinish() async {
    await Future.delayed(Duration(seconds: 2), () {
      isFinish.value = true;
    });
  }

  @override
  void onInit() {
    super.onInit();
    calculateFinish();
  }

  RxBool isLoading = false.obs;

  void submit() async {
    try {
      showLoadingDialog(Get.context!, isLoading);
      await MerchantRepo.verify();
      HomeController.i.getMerchantData();
      await closeLoading(isLoading);

      Get.toNamed(AppRoute.loanBanding);
    } catch (_) {
      await closeLoading(isLoading);
    }
  }
}
