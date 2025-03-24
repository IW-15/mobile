import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/insight_controller.dart';
import 'package:mobile/app/models/common/common_model.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/extensions/map_indexed.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class InsightPage extends GetView<InsightController> {
  const InsightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Post-Event Insight",
        child: Obx(() {
          final event = controller.event.value;
          return Column(
            children: [
              Text(
                event?.name ?? "",
                style: body2BTextStyle(),
              ),
              SizedBox(height: 2.h),
              event != null
                  ? Text(
                      "${formatDate(event.date)} ${convertToWIB(event.time)}",
                      style: body6TextStyle(),
                    )
                  : Container(),
              SizedBox(height: 11.h),
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (e, ei) {
                    controller.currentIndex.value = e;
                  },
                  height: 190.h,
                  viewportFraction: .65,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeFactor: .15,
                ),
                items: [
                  [
                    "Pendapatan",
                    "+58%",
                    "Pendapatan Anda meningkat daripada event sebelumnya. ",
                    "Pendapatan di event ini mencapai Rp4.500.000 lebih banyak."
                  ],
                  [
                    "Penjualan",
                    "+70%",
                    "Penjualan Anda meningkat daripada event sebelumnya. ",
                    "Penjualan di event ini mencapai 45 unit lebih banyak."
                  ],
                  [
                    "Peringkat Tenant",
                    "#11",
                    "Usaha anda merupakan usaha #11 terlaris di event ini.",
                    "Ayo terus tingkatkan penjualan produk untuk meningkatkan peringkat ini di event mendatang!"
                  ],
                ]
                    .mapIndexed(
                      (e, i) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == i
                              ? ColorConstants.slate[25]
                              : ColorConstants.slate[25]!.withOpacity(.5),
                          borderRadius: BorderRadius.circular(15.w),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                e[0],
                                style: body6BTextStyle(size: 9.w),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              e[1],
                              style: h1BTextStyle(
                                size: 48.sp,
                                color: ColorConstants.primary[500],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              e[2],
                              style: body6TextStyle(weight: FontWeight.w500),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              e[3],
                              style: body6TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2]
                    .map(
                      (e) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 8.w,
                        height: 8.w,
                        margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                        decoration: BoxDecoration(
                          color: e == controller.currentIndex.value
                              ? ColorConstants.primary[400]
                              : Color(0xffC4C4C4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 12.h),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Pendapatan",
                            style: body4BTextStyle(),
                          ),
                          SizedBox(height: 4.h),
                          RichText(
                            text: TextSpan(
                              text:
                                  "Aktivitas penjualan produk paling ramai pukul ",
                              children: [
                                TextSpan(
                                  text: "19.45 - 20.15",
                                  style: body5BTextStyle(),
                                ),
                              ],
                              style: body5TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.h,
                      child: SfCartesianChart(
                        palette: controller.palette,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CartesianSeries<Insight, String>>[
                          SplineSeries<Insight, String>(
                            enableTooltip: true,
                            enableTrackball: true,
                            dataSource: controller.allInsightData,
                            xValueMapper: (Insight sales, _) => sales.label,
                            yValueMapper: (Insight sales, _) => sales.data,
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
              SizedBox(height: 12.h),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Penjualan Produk",
                            style: body4BTextStyle(),
                          ),
                          SizedBox(height: 4.h),
                          RichText(
                            text: TextSpan(
                              text: "Sebanyak ",
                              children: [
                                TextSpan(
                                  text: "42 buah Hot Dog ",
                                  style: body5BTextStyle(),
                                ),
                                TextSpan(
                                  text: "terjual selama event berlangsung",
                                  style: body5TextStyle(),
                                ),
                              ],
                              style: body5TextStyle(),
                            ),
                          ),
                        ],
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
                                  ranges: controller.categoryData
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
                                  "Sosis Bakar",
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
                                  "Hot Dog",
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
                                  "Sosis Kentang",
                                  style: body5TextStyle(),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Stock Level",
                            style: body4BTextStyle(),
                          ),
                          SizedBox(height: 4.h),
                          RichText(
                            text: TextSpan(
                              text: "Berikut stock penjualan anda",
                              style: body5TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.h,
                      child: SfCartesianChart(
                        palette: controller.palette,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CartesianSeries<Insight, String>>[
                          ...controller.insightdata.keys.map(
                            (key) => ColumnSeries<Insight, String>(
                              enableTooltip: true,
                              enableTrackball: true,
                              dataSource: controller.insightdata[key],
                              xValueMapper: (Insight sales, _) => sales.label,
                              yValueMapper: (Insight sales, _) => sales.data,
                              name: key,
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
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
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(19.w),
                decoration: BoxDecoration(
                  color: ColorConstants.slate[25],
                  borderRadius: BorderRadius.circular(15.w),
                  boxShadow: [ColorConstants.shadow[1]!],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Optimasi Level Stok",
                      style: body4BTextStyle(),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Berdasarkan penjualan total 200 unit selama acara dari jam 19.00 hingga 22.00, berikut adalah rekomendasi optimasi stok untuk produk sosis bakar, hot dog, dan sosis kentang. Disarankan untuk menyediakan 120 unit sosis bakar, dengan tambahan 20% untuk mengantisipasi permintaan mendesak. Sosis kentang sebaiknya disiapkan sebanyak 80 unit dengan tambahan 20 unit untuk menutupi kemungkinan lonjakan permintaan. Terakhir, untuk Hot dog, rekomendasi stok adalah 50 unit, yang mencakup tambahan 10 unit.",
                      style: body5TextStyle(),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        }),
      ),
    );
  }
}
