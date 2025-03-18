import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/controller/home_controller.dart';
import 'package:mobile/app/presentation/widgets/card_cashflow.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/text_styles.dart';

class HomeCashflow extends StatelessWidget {
  String currDate = DateFormat('MMMM yyyy').format(DateTime.now());
  var controller = HomeController.i;

  HomeCashflow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cashflow",
              style: body4BTextStyle(),
            ),
            Row(
              children: [
                Text(
                  currDate,
                  style: body6TextStyle(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.cashflow);
                  },
                  child: Icon(
                    Icons.chevron_right,
                    size: 20.w,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Obx(
          () => CardCashflow(
            income: controller.cashflow.value?.income ?? 0,
            outcome: controller.cashflow.value?.outcome ?? 0,
          ),
        ),
      ],
    );
  }
}
