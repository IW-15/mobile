import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/credit_score/credit_score_model.dart';
import 'package:mobile/app/presentation/widgets/credit_score_chart.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditScore extends StatelessWidget {
  final CreditScoreModel data;
  const CreditScore({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Credit Score",
              style: body5BTextStyle(),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.creditScore);
              },
              child: Text(
                "Detail Score",
                style: body5TextStyle(
                  color: ColorConstants.primary[500],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CreditScoreChart(data: data),
      ],
    );
  }
}
