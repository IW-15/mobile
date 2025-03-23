import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_cashflow_controller.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class EoCashflowPage extends GetView<EoCashflowController> {
  const EoCashflowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Dashboard Kinerja",
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: ColorConstants.slate[25],
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 20.w,
                            color: ColorConstants.slate[800],
                          ),
                          SizedBox(width: 12.w),
                          Row(
                            children: [
                              Text(
                                "Jan 2024 - Jun 2024",
                                style: body5TextStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.expandDate.value = true;
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 22.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                cardInfo("Pendapatan", formatCurrency(900000), 30),
                SizedBox(width: 6.w),
                cardInfo("Event Selesai", "150", 14),
                SizedBox(width: 6.w),
                cardInfo("Utilisasi Slow", "99%", 5),
              ],
            ),
            SizedBox(height: 11.h),
            Container(
              padding: EdgeInsets.all(9.w),
              decoration: BoxDecoration(
                color: ColorConstants.slate[25],
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      "Pendapatan",
                      style: body4BTextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                    child: SfCartesianChart(
                      palette: controller.palette,
                      primaryXAxis: CategoryAxis(),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries<SalesData, String>>[
                        SplineSeries<SalesData, String>(
                          enableTooltip: true,
                          enableTrackball: true,
                          dataSource: controller.allSalesData,
                          xValueMapper: (SalesData sales, _) => sales.month,
                          yValueMapper: (SalesData sales, _) => sales.data,
                          name: 'Sales',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                          ),
                          markerSettings: MarkerSettings(
                            color: Colors.red,
                          ),
                          legendItemText: "Sales",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(9.w),
              decoration: BoxDecoration(
                color: ColorConstants.slate[25],
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      "Kategori Event",
                      style: body4BTextStyle(),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: SfRadialGauge(
                            axes: [
                              RadialAxis(
                                minimum: 0,
                                maximum: 100,
                                ranges: controller.percentByCategory
                                    .map(
                                      (e) => GaugeRange(
                                        startValue: e.min,
                                        endValue: e.max,
                                        color: e.color,
                                        startWidth: 15.w,
                                        endWidth: 15.w,
                                      ),
                                    )
                                    .toList(),
                                startAngle: 90,
                                labelOffset: 15.w,
                                endAngle: 90,
                                majorTickStyle: MajorTickStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: controller.palette[0],
                                size: 8.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Bazaar",
                                style: body5TextStyle(),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: controller.palette[1],
                                size: 8.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Festival Makanan",
                                style: body5TextStyle(),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: controller.palette[2],
                                size: 8.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Pameran",
                                style: body5TextStyle(),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: controller.palette[3],
                                size: 8.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Konser",
                                style: body5TextStyle(),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(9.w),
              decoration: BoxDecoration(
                color: ColorConstants.slate[25],
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      "Pendapatan Per Kategori",
                      style: body4BTextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                    child: SfCartesianChart(
                      palette: [
                        Color(0xff7987FF),
                        Color(0xffFFA5CB),
                        Color(0xffE697FF),
                        Colors.amberAccent,
                      ],
                      primaryXAxis: CategoryAxis(),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries<SalesData, String>>[
                        ...controller.salesData.keys.map(
                          (key) => ColumnSeries<SalesData, String>(
                            enableTooltip: true,
                            enableTrackball: true,
                            dataSource: controller.salesData[key],
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.data,
                            name: key,
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                            ),
                            markerSettings: MarkerSettings(
                              color: Colors.red,
                            ),
                            legendItemText: key,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget cardInfo(String label, String detail, int percent) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(9.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: body6TextStyle(),
            ),
            SizedBox(height: 5.h),
            Text(
              detail,
              style: body5BTextStyle(),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_circle_up_outlined,
                  color: Colors.green,
                  size: 15.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  "$percent%",
                  style: body6TextStyle(
                    color: Colors.green,
                    weight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              "to previous period",
              style: body6TextStyle(
                size: 8.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
