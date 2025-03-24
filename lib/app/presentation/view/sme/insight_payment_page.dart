import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/global_settings.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class InsightPaymentPage extends StatefulWidget {
  const InsightPaymentPage({super.key});

  @override
  State<InsightPaymentPage> createState() => _InsightPaymentPageState();
}

class _InsightPaymentPageState extends State<InsightPaymentPage> {
  String passcodePayment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Pembayaran Event",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40.w),
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 40.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.w),
                color: ColorConstants.slate[100],
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (e) => AnimatedContainer(
                        duration: Duration(milliseconds: 150),
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        width: passcodePayment.length == e ? 18.w : 12.w,
                        height: passcodePayment.length == e ? 18.w : 12.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: passcodePayment.length >= e
                              ? ColorConstants.primary[500]
                              : ColorConstants.slate[300],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Please enter your 4 digit passcode",
                    style: body4TextStyle(
                      color: ColorConstants.slate[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      numpad("1"),
                      numpad("2"),
                      numpad("3"),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      numpad("4"),
                      numpad("5"),
                      numpad("6"),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      numpad("7"),
                      numpad("8"),
                      numpad("9"),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 60.w),
                      numpad("0"),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            passcodePayment = "";
                          });
                        },
                        child: SizedBox(
                          width: 60.w,
                          child: Center(
                            child: Icon(
                              Icons.close,
                              size: 36.w,
                              color: ColorConstants.slate[500],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget numpad(String number) {
    return GestureDetector(
      onTap: () {
        if (passcodePayment.length == 3) {
          Global.isInsight = true;
          Get.back();
          Get.back();
          Get.back();
          Get.toNamed(AppRoute.insightPaid);
          return;
        }
        setState(() {
          passcodePayment += "1";
        });
      },
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [ColorConstants.shadow[1]!],
        ),
        child: Center(
          child: Text(
            number,
            style: h1TextStyle(
              size: 30.sp,
              color: ColorConstants.slate[600],
            ),
          ),
        ),
      ),
    );
  }
}
