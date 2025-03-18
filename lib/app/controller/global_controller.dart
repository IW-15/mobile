import 'package:get/get.dart';
import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/app/models/outlet_revenue/outlet_revenue_model.dart';
import 'package:mobile/app/models/profile/profile_model.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find<GlobalController>();

  Rxn<ProfileModel> profile = Rxn<ProfileModel>();
  Rxn<MerchantModel> merchant = Rxn<MerchantModel>();
  RxList<OutletRevenueModel> revenue = RxList<OutletRevenueModel>([]);
}
