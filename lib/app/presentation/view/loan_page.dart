import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_controller.dart';
import 'package:mobile/app/presentation/partials/talangan/card_loan_approved.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_dropdown.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/credit_chart.dart';
import 'package:mobile/app/presentation/widgets/loan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/input_validator.dart';

class LoanPage extends GetView<LoanController> {
  const LoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoanScaffold(
      title: "Loan",
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => CardLoanApproved(data: controller.loanProfile.value),
            ),
            SizedBox(height: 16.h),
            AppInput(
              prefix: Text(
                "Rp | ",
                style: body4TextStyle(color: ColorConstants.slate[500]),
              ),
              controller: controller.form['amount']!,
              keyboardType: TextInputType.number,
              onChange: (e) {
                controller.amount.value = int.tryParse(e);
              },
              label: "Amount",
              placeholder: "Input Loan Amount",
              validator: controller.amountValidator,
            ),
            SizedBox(height: 12.h),
            Obx(
              () => AppDropdown<int>(
                placeholder: "Input Tenor",
                label: "Tenor",
                items: [
                  AppDropdownItem(text: "3 Bulan", value: 3),
                  AppDropdownItem(text: "6 Bulan", value: 6),
                  AppDropdownItem(text: "12 Bulan", value: 12),
                ],
                value: controller.tenor.value,
                onChanged: (e) {
                  controller.tenor.value = e;
                },
                validator: (e) =>
                    inputValidator(controller.tenor.value.toString(), "Tenor"),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Features :",
              style: body5BTextStyle(),
            ),
            SizedBox(height: 10.h),
            ...[
              [Icons.timelapse, "Minimum time limit to pay."],
              [Icons.circle_notifications, "Quick repayment available."],
              [Icons.visibility_off, "No hidden Charges."],
              [Icons.download, "The amount will be credited within 1 hour."],
              [Icons.thumb_up, "NOC will be share within 48 hrs."],
              [Icons.verified, "Aadhar OTP Authectication"],
            ].map((e) => Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            color: Color(0xff5B93FF).withOpacity(.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            e[0] as IconData,
                            color: ColorConstants.primary[500],
                            size: 15.w,
                          ),
                        ),
                        Text(
                          e[1] as String,
                          style: body5TextStyle(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                )),
            Expanded(child: Container()),
            SizedBox(
              height: 20.h,
            ),
            AppButton(
              onPressed: controller.inputAmount,
              text: "Next",
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
