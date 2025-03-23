import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardEventInsight extends StatelessWidget {
  const CardEventInsight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      width: 1.sw,
      height: 154.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/bg_event_insight.png",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [ColorConstants.shadow[1]!],
      ),
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Penjualan es teh paling laris di event bazaar",
                  style: body3BTextStyle(),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Analisis menunjukkan bahwa faktor cuaca yang panas serta promosi kreatif dari penjual berkontribusi besar terhadap kesuksesan ini.",
                  style: body6TextStyle(),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/ice-tea.png",
            height: 120.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
