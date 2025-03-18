import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardIncome extends StatelessWidget {
  String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
  CardIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Pendapatan Hari ini,  ",
                    style: body6TextStyle(),
                  ),
                  Text(
                    formattedDate,
                    style: body6BTextStyle(),
                  )
                ],
              ),
              Text(
                "Lihat Detail",
                style: body6BTextStyle(),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            "Rp4.300.000",
            style: h2BTextStyle(),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: Color(0xffE0E5FF),
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/qris.png",
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Tampilkan QRIS",
                      style: body6TextStyle(
                        color: ColorConstants.primary[500],
                        weight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: ColorConstants.primary[500],
                      size: 16.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
