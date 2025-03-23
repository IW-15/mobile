import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_cashflow_controller.dart';
import 'package:mobile/app/models/cashflow/cashflow_model.dart';
import 'package:mobile/app/repository/cashflow_repo.dart';
import 'package:mobile/styles/color_constants.dart';

class CashflowController extends GetxController {
  static CashflowController get i => Get.find<CashflowController>();

  Rxn<CashflowModel> cashflow = Rxn<CashflowModel>();

  RxMap<String, List<SalesData>> salesData = <String, List<SalesData>>{
    "income": [
      SalesData("Jan", 450),
      SalesData("Feb", 200),
      SalesData("Mar", 750),
      SalesData("Apr", 320),
      SalesData("May", 150),
      SalesData("Jun", 600),
    ],
    "outcome": [
      SalesData("Jan", 300),
      SalesData("Feb", 500),
      SalesData("Mar", 900),
      SalesData("Apr", 220),
      SalesData("May", 700),
      SalesData("Jun", 210),
    ],
  }.obs;

  List<Color> palette = [
    Colors.green,
    ColorConstants.error,
  ];

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
