import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/models/loan_profile/loan_profile_model.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class CardTalangan extends StatelessWidget {
  final LoanProfileModel? data;
  const CardTalangan({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff033DED).withOpacity(.1),
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Balance Talangan",
                  style: body5TextStyle(),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.hexagon,
                      color: Colors.black,
                      size: 16.w,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "1.024 Poin",
                      style: body5TextStyle(),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 16.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: ColorConstants.primary[500],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Saldo Tersedia',
                      style: body6TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Lihat Detail",
                      style: body6TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  data == null
                      ? ""
                      : formatCurrency(data!.maxAmount - data!.limit),
                  style: h2BTextStyle(color: Colors.white),
                ),
                SizedBox(height: 12.h),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: LinearProgressIndicator(
                    value: data == null
                        ? 1
                        : (data!.maxAmount - data!.limit) / data!.maxAmount,
                    backgroundColor: ColorConstants.slate[100],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
