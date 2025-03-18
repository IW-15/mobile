import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/models/loan/loan_model.dart';
import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class CardLoan extends StatelessWidget {
  final LoanModel data;
  final MerchantModel merchant;

  const CardLoan({
    super.key,
    required this.data,
    required this.merchant,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.loanDetail(data.id.toString()));
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorConstants.slate[200]!,
              ),
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: ColorConstants.slate[100],
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      margin: EdgeInsets.only(right: 16.w),
                      child: Icon(
                        Icons.storefront_rounded,
                        color: ColorConstants.primary[500],
                        size: 24.w,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            merchant.name,
                            style: h5TextStyle(),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Jumlah",
                            style: body5TextStyle(),
                          ),
                          Text(
                            formatCurrency(data.amount),
                            style: body3BTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          formatDate(data.applicationDate),
                          style: body6TextStyle(),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Tenor",
                          style: body5TextStyle(),
                        ),
                        Text(
                          "${data.tenor} Bulan",
                          style: body5BTextStyle(),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 28.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "In Progress",
                      style: body5TextStyle(),
                    ),
                    Row(children: [
                      Text(
                        "Detail Talangan",
                        style: body6TextStyle(
                          color: ColorConstants.primary[500],
                          weight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.chevron_right,
                        color: ColorConstants.primary[500],
                        size: 16.w,
                      ),
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  String formatDate(DateTime date) {
    String currDate = DateFormat('dd MMMM yyyy').format(date);
    return currDate;
  }
}
