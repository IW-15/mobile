import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/models/repayment/repayment_model.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';
import 'package:mobile/utils/format_date.dart';

class CardRepayment extends StatelessWidget {
  final RepaymentModel data;
  const CardRepayment({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConstants.slate[200]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Cicilan Ke-${data.order}",
                  style: body5TextStyle(weight: FontWeight.w600),
                ),
                Text(
                  formatDate(data.date),
                  style: body5TextStyle(),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(data.amount),
            style: body4BTextStyle(),
          ),
        ],
      ),
    );
  }
}
