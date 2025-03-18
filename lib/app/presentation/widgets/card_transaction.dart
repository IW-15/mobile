import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/models/transaction/transaction_model.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';
import 'package:mobile/utils/format_date.dart';

class CardTransaction extends StatelessWidget {
  final TransactionModel data;
  CardTransaction({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConstants.slate[300]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: body5BTextStyle(),
                ),
                SizedBox(height: 4.h),
                Text(
                  "${formatDate(data.date, format: "dd MMMM yyyy mm:ss")} WIB",
                  style: body5TextStyle(),
                ),
              ],
            ),
          ),
          Text(
            "${data.type == "credit" ? "+" : "-"} ${formatCurrency(data.amount)}",
            style: body4BTextStyle(
              weight: FontWeight.w800,
              color: data.type == "credit" ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
