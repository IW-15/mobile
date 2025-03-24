import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/insight_controller.dart';
import 'package:mobile/app/presentation/partials/event/card_invoice.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class InsightInvoicePage extends GetView<InsightController> {
  const InsightInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Pembayaran Event",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardInvoice(total: 50000),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pembayaran",
                  style: body4TextStyle(),
                ),
                Text(
                  formatCurrency(50000),
                  style: body5BTextStyle(),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            AppButton(
              onPressed: () {
                Get.toNamed(AppRoute.insightPayment);
              },
              text: "Bayar",
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
