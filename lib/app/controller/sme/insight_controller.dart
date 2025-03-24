import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_registered_controller.dart';
import 'package:mobile/app/models/common/common_model.dart';
import 'package:mobile/app/models/event/event_model.dart';

class InsightController extends GetxController {
  static InsightController get i => Get.find<InsightController>();
  Rxn<EventModel> event = Rxn<EventModel>();
  RxInt currentIndex = 0.obs;

  RxMap<String, List<Insight>> insightdata = <String, List<Insight>>{
    "Sosis Bakar": [
      Insight("19:00", 5), // Previously 450
      Insight("19:30", 6), // Previously 200
      Insight("20:00", 9), // Previously 750
      Insight("20:30", 7), // Previously 320
      Insight("21:00", 5), // Previously 150
      Insight("21:30", 8), // Previously 600
    ],
    "Hot Dog": [
      Insight("19:00", 5), // Previously 300
      Insight("19:30", 7), // Previously 500
      Insight("20:00", 10), // Previously 900
      Insight("20:30", 6), // Previously 220
      Insight("21:00", 9), // Previously 700
      Insight("21:30", 5), // Previously 210
    ],
    "Sosis Kentang": [
      Insight("19:00", 10), // Previously 1000
      Insight("19:30", 6), // Previously 500
      Insight("20:00", 8), // Previously 650
      Insight("20:30", 5), // Previously 200
      Insight("21:00", 7), // Previously 300
      Insight("21:30", 5), // Previously 100
    ],
  }.obs;
  RxList<Insight> allInsightData = <Insight>[].obs;
  RxList<CategoryInsight> categoryData = <CategoryInsight>[].obs;

  List<String> times = ["19:00", "19:30", "20:00", "20:30", "21:00", "21:30"];

  List<Color> palette = [
    Color(0xff7987FF),
    Color(0xffFFA5CB),
    Color(0xffE697FF),
    Colors.amberAccent,
  ];

  void getAllInsight() {
    List<Insight> tempSales = [];
    for (String time in times) {
      double totalSales = 0;
      insightdata.forEach((key, value) {
        totalSales += value.firstWhere((data) => data.label == time).data;
      });
      tempSales.add(Insight(time, totalSales));
    }
    allInsightData.value = tempSales;
    allInsightData.refresh();
    insightdata.listen((e) {
      List<Insight> tempSales = [];
      for (String time in times) {
        double totalSales = 0;
        insightdata.forEach((key, value) {
          totalSales += value.firstWhere((data) => data.label == time).data;
        });
        tempSales.add(
          Insight(time, totalSales),
        );
      }
      allInsightData.value = tempSales;
      allInsightData.refresh();
    });
  }

  void getPercentByCategory(RxMap<String, List<Insight>> insightdata) {
    double totalSales = 0;

    // Hitung total penjualan
    insightdata.forEach((key, value) {
      for (var sales in value) {
        totalSales += sales.data;
      }
    });

    List<CategoryInsight> percentList = [];
    double current = 0;
    int index = 0;

    // Hitung persentase untuk masing-masing kategori
    insightdata.forEach((category, records) {
      double categoryTotal = 0;
      for (var record in records) {
        categoryTotal += record.data;
      }
      double percentage = (categoryTotal / totalSales) * 100;
      percentList.add(
        CategoryInsight(
          palette[index],
          current,
          current + percentage,
          category,
        ),
      );
      index++;
      current += percentage;
    });

    categoryData.value = percentList;
  }

  void getEvent() {
    event.value = SmeDetailEventRegisteredController.i.data.value!.event;
  }

  @override
  void onInit() {
    super.onInit();
    getEvent();
    getAllInsight();
    getPercentByCategory(insightdata);
  }
}
