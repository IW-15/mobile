import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/cashflow_controller.dart';
import 'package:mobile/app/controller/eo/eo_cashflow_controller.dart';
import 'package:mobile/app/presentation/widgets/card_cashflow.dart';
import 'package:mobile/app/presentation/widgets/card_transaction.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CashflowPage extends GetView<CashflowController> {
  const CashflowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Cashflow",
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                        "Financial Report",
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
                          ...controller.salesData.keys.map(
                            (key) => SplineSeries<SalesData, String>(
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
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.all(6.w),
                      child: CardCashflow(
                        income: controller.cashflow.value?.income ?? 0,
                        outcome: controller.cashflow.value?.outcome ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Cashflow",
                style: body4BTextStyle(),
              ),
              SizedBox(height: 12.h),
              SizedBox(height: 20.h),
              Text(
                "Transaksi Terakhir",
                style: body4BTextStyle(),
              ),
              SizedBox(height: 12.h),
              ...(controller.cashflow.value?.history ?? [])
                  .map((e) => CardTransaction(data: e))
            ],
          ),
        ),
      ),
    );
  }
}
