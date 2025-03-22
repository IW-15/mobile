import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/eo/eo_model.dart';
import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/app/models/outlet_revenue/outlet_revenue_model.dart';
import 'package:mobile/app/models/profile/profile_model.dart';
import 'package:mobile/app/models/user/user_model.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find<GlobalController>();

  Rxn<ProfileModel> profile = Rxn<ProfileModel>();
  Rxn<UserModel> user = Rxn<UserModel>();
  Rxn<EoModel> eo = Rxn<EoModel>();
  Rxn<MerchantModel> merchant = Rxn<MerchantModel>();
  RxList<OutletRevenueModel> revenue = RxList<OutletRevenueModel>([]);
  Rxn<Position> position = Rxn<Position>();

  Future determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      position.value = await Geolocator.getCurrentPosition();
    } catch (_) {}
  }

  @override
  void onInit() {
    super.onInit();
    determinePosition();
  }
}
