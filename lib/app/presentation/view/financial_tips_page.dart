import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_controller.dart';
import 'package:mobile/app/presentation/widgets/card_tips.dart';
import 'package:mobile/app/presentation/widgets/loan_scaffold.dart';

class FinancialTipsPage extends GetView<LoanController> {
  const FinancialTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoanScaffold(
      title: "Financial Tips",
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            ...[
              "Plan for Financial Health",
              "Manage and Secure\nCashflow",
              "Empowering with Financial\nHealth",
              "Plan for Financial Health",
              "Manage and Secure\nCashflow",
              "Empowering with Financial\nHealth",
            ].map((e) => CardTips(text: e))
          ],
        ),
      ),
    );
  }
}
