import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/controller/loan_detail_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';
import 'package:mobile/utils/format_date.dart';

class LoanRepaymentPage extends GetView<LoanDetailController> {
  const LoanRepaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Bayar Cicilan",
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(color: ColorConstants.slate[300]!),
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              padding: EdgeInsets.all(13.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Virtual Account Mandiri",
                          style: body4BTextStyle(),
                        ),
                      ),
                      Icon(
                        Icons.copy,
                        color: ColorConstants.primary[500],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "026474529746137",
                    style: h4BTextStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(color: ColorConstants.slate[300]!),
                boxShadow: [ColorConstants.shadow[1]!],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
                    child: Text(
                      "Detail Cicilan",
                      style: body5BTextStyle(),
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: ColorConstants.slate[300],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        element(
                          "Nama",
                          GlobalController.i.merchant.value?.name ?? "",
                        ),
                        element(
                          "Jumlah Tagihan",
                          formatCurrency(
                            controller.loanData.value?.monthlyBill ?? 0,
                          ),
                        ),
                        element(
                          "Tagihan ke-",
                          (controller.repayments.length + 1).toString(),
                        ),
                        element(
                          "Batas Waktu Pembayaran",
                          formatDate(
                            DateTime.now().add(
                              Duration(
                                days: 14,
                              ),
                            ),
                          ),
                          end: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            AppButton(
              onPressed: controller.submitRepayment,
              text: "Konfirmasi Cicilan",
              width: 1.sw,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget element(String label, String desc, {bool end = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        label,
        style: body5TextStyle(color: ColorConstants.slate[600]),
      ),
      Text(
        desc,
        style: body5BTextStyle(color: ColorConstants.slate[600]),
      ),
      SizedBox(height: end ? 0 : 16.h),
    ]);
  }
}
