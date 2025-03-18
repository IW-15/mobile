import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_banding_controller.dart';
import 'package:mobile/app/presentation/partials/talangan/card_loan_approved.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/credit_score_chart.dart';
import 'package:mobile/app/presentation/widgets/loan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';

class LoanBandingPage extends GetView<LoanBandingController> {
  const LoanBandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoanScaffold(
      title: "Loan",
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardLoanApproved(data: controller.loanProfile.value),
            SizedBox(height: 40.h),
            controller.creditScore.value != null
                ? CreditScoreChart(
                    data: controller.creditScore.value!,
                  )
                : Container(),
            Expanded(
              child: Container(),
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Get.offNamedUntil(
                        AppRoute.talangan,
                        ModalRoute.withName(AppRoute.home),
                      );
                    },
                    text: "Ajukan",
                    variant: AppButtonVariant.secondary,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Get.offNamedUntil(
                        AppRoute.talangan,
                        ModalRoute.withName(AppRoute.home),
                      );
                    },
                    text: "Setujui",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
