import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardCashflow extends StatelessWidget {
  const CardCashflow({
    super.key,
    required this.income,
    required this.outcome,
  });

  final int income;
  final int outcome;

  @override
  Widget build(BuildContext context) {
    String formattedIncome = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(income);

    String formattedOutcome = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(outcome);

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/income.png",
                  width: 40.w,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Income",
                  style: body5BTextStyle(
                    color: ColorConstants.slate[600],
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  formattedIncome,
                  style: body3BTextStyle(),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/outcome.png",
                  width: 40.w,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Outcome",
                  style: body5BTextStyle(
                    color: ColorConstants.slate[600],
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  formattedOutcome,
                  style: body3BTextStyle(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
