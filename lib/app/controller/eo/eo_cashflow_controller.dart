import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EoCashflowController extends GetxController {
  static EoCashflowController get i => Get.find<EoCashflowController>();

  RxBool expandDate = false.obs;
  RxMap<String, List<SalesData>> salesData = <String, List<SalesData>>{
    "Bazaar": [
      SalesData("Jan", 450),
      SalesData("Feb", 200),
      SalesData("Mar", 750),
      SalesData("Apr", 320),
      SalesData("May", 150),
      SalesData("Jun", 600),
    ],
    "Festival Makanan": [
      SalesData("Jan", 300),
      SalesData("Feb", 500),
      SalesData("Mar", 900),
      SalesData("Apr", 220),
      SalesData("May", 700),
      SalesData("Jun", 210),
    ],
    "Pameran": [
      SalesData("Jan", 1000),
      SalesData("Feb", 500),
      SalesData("Mar", 650),
      SalesData("Apr", 200),
      SalesData("May", 300),
      SalesData("Jun", 100),
    ],
    "Konser": [
      SalesData("Jan", 300),
      SalesData("Feb", 200),
      SalesData("Mar", 290),
      SalesData("Apr", 100),
      SalesData("May", 800),
      SalesData("Jun", 700),
    ],
  }.obs;

  RxList<SalesData> allSalesData = <SalesData>[].obs;
  void initSalesData() {
    List<SalesData> tempSales = [];
    for (String month in ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]) {
      double totalSales = 0;
      salesData.forEach((key, value) {
        totalSales += value.firstWhere((data) => data.month == month).data;
      });
      tempSales.add(SalesData(month, totalSales));
    }
    allSalesData.value = tempSales;
    allSalesData.refresh();
    salesData.listen((e) {
      List<SalesData> tempSales = [];
      for (String month in ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]) {
        double totalSales = 0;
        salesData.forEach((key, value) {
          totalSales += value.firstWhere((data) => data.month == month).data;
        });
        tempSales.add(SalesData(month, totalSales));
      }
      allSalesData.value = tempSales;
      allSalesData.refresh();
    });
  }

  List<Color> palette = [
    Color(0xff7987FF),
    Color(0xffFFA5CB),
    Color(0xffE697FF),
    Colors.amberAccent,
  ];
  RxList<CategorySales> percentByCategory = <CategorySales>[].obs;

  void getPercentByCategory(RxMap<String, List<SalesData>> salesData) {
    double totalSales = 0;

    // Hitung total penjualan
    salesData.forEach((key, value) {
      for (var sales in value) {
        totalSales += sales.data;
      }
    });

    List<CategorySales> percentList = [];
    double current = 0;
    int index = 0;

    // Hitung persentase untuk masing-masing kategori
    salesData.forEach((category, records) {
      double categoryTotal = 0;
      for (var record in records) {
        categoryTotal += record.data;
      }
      double percentage = (categoryTotal / totalSales) * 100;
      percentList.add(
        CategorySales(
          palette[index],
          current,
          current + percentage,
          category,
        ),
      );
      index++;
      current += percentage;
    });

    percentByCategory.value = percentList;
  }

  @override
  void onInit() {
    super.onInit();
    initSalesData();
    getPercentByCategory(salesData);
  }
}

class SalesData {
  final String month;
  final double data;

  const SalesData(
    this.month,
    this.data,
  );
}

class CategorySales {
  final Color color;
  final double min;
  final double max;
  final String label;

  const CategorySales(
    this.color,
    this.min,
    this.max,
    this.label,
  );
}
