import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/insight_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class InsightOnboardPage extends GetView<InsightController> {
  const InsightOnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "",
        leading: false,
        action: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.close_rounded,
            size: 24.w,
          ),
        ),
        child: Column(
          children: [
            Text(
              "Post-Event Insight",
              style: h3BTextStyle(),
            ),
            SizedBox(height: 2.h),
            Text(
              "Fitur Premium",
              style: body4TextStyle(size: 15.sp, weight: FontWeight.w600),
            ),
            SizedBox(height: 32.h),
            Image.asset(
              "assets/images/insight_onboard.png",
              width: 312.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 32.h),
            ...[
              [
                "assets/icons/point_of_sale.png",
                "Analisis Penjualan POS: Ketahui produk terlaris",
              ],
              [
                "assets/icons/clock_fast.png",
                "Jam-Jam Sibuk : Temukan waktu penjualan tertinggi",
              ],
              [
                "assets/icons/report_bar.png",
                "Laporan Persediaan Inventaris: Ketahui produk yang perlu di-restock.",
              ],
              [
                "assets/icons/stock.png",
                "Rekomendasi Optimasi Stok: Ketahui level stok optimal",
              ],
            ].map(
              (e) => Container(
                margin: EdgeInsets.symmetric(vertical: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      e[0],
                      width: 20.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Text(
                        e[1],
                        style: body5TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            AppButton(
              onPressed: () {
                Get.toNamed(AppRoute.insightInvoice);
              },
              text: "",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Obx(
                          () => Text(
                            controller.event.value?.name ?? "",
                            style: body6TextStyle(
                              color: Colors.white,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          formatCurrency(50000),
                          style: body1BTextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Bayar",
                        style: body5BTextStyle(
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 20.w,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FAQ",
                  style: body6TextStyle(height: 1),
                ),
                SizedBox(width: 3.w),
                Icon(
                  Icons.circle,
                  size: 6.w,
                  color: ColorConstants.slate[400],
                ),
                SizedBox(width: 3.w),
                Text(
                  "Syarat dan Ketentuan",
                  style: body6TextStyle(height: 1),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
