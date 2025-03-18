import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/cashflow_controller.dart';
import 'package:mobile/app/presentation/widgets/card_cashflow.dart';
import 'package:mobile/app/presentation/widgets/card_transaction.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/text_styles.dart';

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
              Text(
                "Cashflow",
                style: body4BTextStyle(),
              ),
              SizedBox(height: 12.h),
              CardCashflow(
                income: controller.cashflow.value?.income ?? 0,
                outcome: controller.cashflow.value?.outcome ?? 0,
              ),
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
