import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/models/loan_profile/loan_profile_model.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class CardLoanApproved extends StatelessWidget {
  final LoanProfileModel? data;
  const CardLoanApproved({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.primary[400]!),
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Column(
            children: [
              Text(
                "You approved loan amount Up to",
                style: body5BTextStyle(),
              ),
              SizedBox(height: 10.h),
              Text(
                formatCurrency((data?.maxAmount ?? 0) - (data?.limit ?? 0)),
                style: body2BTextStyle(),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                ),
                clipBehavior: Clip.antiAlias,
                child: LinearProgressIndicator(
                  value: data == null
                      ? 0
                      : (data!.limit / data!.maxAmount == 0
                          ? .05
                          : data!.limit / data!.maxAmount),
                  minHeight: 20,
                  backgroundColor: Colors.grey[300],
                  color: ColorConstants.primary[500],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatCurrency(data?.minAmount ?? 0),
                    style: body5BTextStyle(),
                  ),
                  Text(
                    formatCurrency(data?.maxAmount ?? 0),
                    style: body5BTextStyle(),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Color(0xffDFE6FF),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff5B93FF).withOpacity(.5),
                      ),
                      child: Icon(
                        Icons.currency_exchange,
                        color: ColorConstants.primary[500],
                        size: 18.w,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Processing Fee",
                          style: body5TextStyle(),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "500 - 800",
                          style: body5BTextStyle(weight: FontWeight.w900),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Color(0xffDFE6FF),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff5B93FF).withOpacity(.5),
                      ),
                      child: Icon(
                        Icons.timelapse,
                        color: ColorConstants.primary[500],
                        size: 18.w,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tenure",
                          style: body5TextStyle(),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Up to 30 days",
                          style: body5BTextStyle(weight: FontWeight.w900),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
