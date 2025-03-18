import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/controller/loan_detail_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/card_repayment.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/get_id.dart';

class LoanDetailPage extends GetView<LoanDetailController> {
  const LoanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Detail Talangan",
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      GlobalController.i.merchant.value?.name ?? "",
                      style: body4BTextStyle(),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                controller.loanData.value?.amount ?? 0,
                              ),
                              style: body3BTextStyle(),
                            ),
                          ],
                        ),
                        Text(
                          formatDate(
                            controller.loanData.value?.applicationDate,
                          ),
                          style: body5TextStyle(),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tagihan per Bulan",
                              style: body5TextStyle(),
                            ),
                            Text(
                              formatCurrency(
                                controller.loanData.value?.monthlyBill ?? 0,
                              ),
                              style: body3BTextStyle(),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Tenor",
                              style: body5TextStyle(),
                            ),
                            Text(
                              "${controller.loanData.value?.tenor} Bulan",
                              style: body5BTextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Riwayat Cicilan",
                style: body5BTextStyle(
                  color: ColorConstants.primary[500],
                ),
              ),
              controller.repayments.isEmpty
                  ? Column(
                      children: [
                        SizedBox(height: 20.h),
                        Image.asset(
                          "assets/images/not-found.png",
                          width: 250.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Tidak ada data riwayat cicilan tersedia",
                          style: body4TextStyle(),
                        ),
                      ],
                    )
                  : Container(),
              ...controller.repayments.map(
                (e) => CardRepayment(data: e),
              ),
              Expanded(child: Container()),
              SizedBox(height: 20.h),
              AppButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.loanRepayment(getId()));
                  },
                  text: "Bayar Cicilan"),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
