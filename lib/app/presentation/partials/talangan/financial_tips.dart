import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/presentation/widgets/card_tips.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/text_styles.dart';

class FinancialTips extends StatelessWidget {
  const FinancialTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Financial Tips",
              style: body5BTextStyle(),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.financialTips);
              },
              child: Text(
                "Lihat Semua",
                style: body5TextStyle(),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        ...[
          "Plan for Financial Health",
          "Manage and Secure\nCashflow",
          "Empowering with Financial\nHealth"
        ].map((e) => CardTips(text: e))
      ],
    );
  }
}
