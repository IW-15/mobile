import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/controller/loan_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/loan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class LoanInstallmentPage extends GetView<LoanController> {
  const LoanInstallmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return LoanScaffold(
      title: "Loan Installment",
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jumlah",
                              style: body5TextStyle(),
                            ),
                            Text(
                              formatCurrency(
                                int.parse(controller.form['amount']!.text),
                              ),
                              style: body5BTextStyle(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: body5TextStyle(),
                            ),
                            Text(
                              GlobalController.i.profile.value?.user.fullName ??
                                  "",
                              style: body5BTextStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tenor",
                              style: body5TextStyle(),
                            ),
                            Text(
                              "${controller.tenor.value} Bulan",
                              style: body5BTextStyle(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank Account",
                              style: body5TextStyle(),
                            ),
                            Text(
                              "Rp. 1.000.000",
                              style: body5BTextStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 40.h,
              color: ColorConstants.slate[200],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40.h),
                    ...List.generate(controller.tenor.value!, (index) {
                      return Column(
                        children: [
                          Icon(
                            Icons.circle,
                            color: ColorConstants.primary[500],
                            size: 8,
                          ),
                          Container(
                            height: 60.h,
                            width: 1.w,
                            color: ColorConstants.slate[200],
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Column(
                    children: List.generate(controller.tenor.value!, (index) {
                      DateTime monthDate =
                          DateTime(now.year, now.month + index, 1);
                      String monthName = _getMonthName(monthDate.month);

                      return Column(
                        children: [
                          AppInput(
                            controller: TextEditingController(
                              text:
                                  formatCurrency(controller.monthlyBill.value),
                            ),
                            label: monthName,
                            readOnly: true,
                          ),
                          SizedBox(height: 12.h),
                        ],
                      );
                    }),
                  ),
                )
              ],
            ),
            Expanded(child: Container()),
            SizedBox(height: 20.h),
            AppButton(
              onPressed: () {
                Get.toNamed(AppRoute.loanSummary);
              },
              text: "Proses",
            ),
            SizedBox(height: 12.h),
            AppButton(
              variant: AppButtonVariant.secondary,
              onPressed: () {
                Get.back();
              },
              text: "Kembali",
            ),
          ],
        ),
      ),
    );
  }

  // Function to get the month name.
  String _getMonthName(int month) {
    const List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }
}
