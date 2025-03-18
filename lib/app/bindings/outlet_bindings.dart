import 'package:get/get.dart';
import 'package:mobile/app/controller/create_outlet_controller.dart';
import 'package:mobile/app/controller/detail_outlet_controller.dart';
import 'package:mobile/app/controller/outlet_controller.dart';

class OutletBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OutletController>(OutletController());
    Get.lazyPut<CreateOutletController>(() => CreateOutletController());
    Get.lazyPut<DetailOutletController>(() => DetailOutletController());
  }
}
