import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/credit_score_controller.dart';
import 'package:mobile/app/presentation/partials/home/home_cashflow.dart';
import 'package:mobile/app/presentation/partials/talangan/all_loan.dart';
import 'package:mobile/app/presentation/widgets/credit_score_chart.dart';
import 'package:mobile/app/presentation/widgets/loan_scaffold.dart';

class CreditScorePage extends GetView<CreditScoreController> {
  const CreditScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoanScaffold(
      title: 'Credit Score Details',
      child: Obx(
        () => Column(
          children: [
            controller.creditScore.value == null
                ? Container()
                : CreditScoreChart(
                    data: controller.creditScore.value!,
                  ),
            SizedBox(height: 20.h),
            HomeCashflow(),
            SizedBox(height: 28.h),
            AllLoan(
              // ignore: invalid_use_of_protected_member
              data: controller.loans.value,
            ),
          ],
        ),
      ),
    );
  }
}
