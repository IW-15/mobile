import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/detail_outlet_controller.dart';
import 'package:mobile/app/controller/outlet_controller.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/repository/outlet_repo.dart';
import 'package:mobile/utils/get_id.dart';
import 'package:mobile/utils/show_alert.dart';

class CreateOutletController extends GetxController {
  static CreateOutletController get i => Get.find<CreateOutletController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool edit = false.obs;
  Rxn<OutletModel> data = Rxn<OutletModel>();
  void getOutletData() async {
    try {
      var res = await OutletRepo.get(getId());
      data.value = res;
      form['name']!.text = res.name;
      form['type']!.text = res.type;
      form['phone']!.text = res.phone;
      form['email']!.text = res.email;
      form['address']!.text = res.address;
      form['id_revenue']!.text = res.id_revenue.toString();
      id_revenue.value = res.id_revenue.toString();
      type.value = res.type;
    } catch (_) {}
  }

  RxMap<String, TextEditingController> form = {
    "name": TextEditingController(),
    "type": TextEditingController(),
    "phone": TextEditingController(),
    "email": TextEditingController(),
    "address": TextEditingController(),
    "id_revenue": TextEditingController(),
  }.obs;

  RxnString id_revenue = RxnString();

  RxBool isLoading = false.obs;

  void submit() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog(Get.context!, isLoading);
        final inputForm = {
          "id_revenue": form["id_revenue"]!.text,
          "name": form["name"]!.text,
          "type": form["type"]!.text,
          "phone": form["phone"]!.text,
          "email": form["email"]!.text,
          "address": form["address"]!.text,
        };

        await OutletRepo.create(inputForm);
        showAlert("Success add outlet", isSuccess: true);
        OutletController.i.getAllOutlets();
        await closeLoading(isLoading);
        Get.back();
      } catch (error) {
        await closeLoading(isLoading);
      }
    }
  }

  RxnString type = RxnString();

  void updateData() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog(Get.context!, isLoading);
        final inputForm = {
          "id_revenue": form["id_revenue"]!.text,
          "name": form["name"]!.text,
          "type": form["type"]!.text,
          "phone": form["phone"]!.text,
          "address": form["address"]!.text,
        };

        await OutletRepo.edit(getId(), inputForm);
        showAlert("Success edit outlet", isSuccess: true);
        DetailOutletController.i.getOutletData();
        OutletController.i.getAllOutlets();
        await closeLoading(isLoading);
        Get.back();
      } catch (error) {
        await closeLoading(isLoading);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();

    if (Get.currentRoute.contains("edit")) {
      edit.value = true;
      getOutletData();
    }
  }
}
