import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme_detail_event_controller.dart';
import 'package:mobile/app/presentation/partials/event/card_invoice.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class SmeEventInvoicePage extends GetView<SmeDetailEventController> {
  const SmeEventInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Pembayaran Event",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardInvoice(),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pembayaran",
                  style: body4TextStyle(),
                ),
                Text(
                  formatCurrency(301000),
                  style: body5BTextStyle(),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            AppButton(
              onPressed: () {
                Get.toNamed(AppRoute.eventPayment("5"));
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
