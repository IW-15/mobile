import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class CardInvoice extends StatelessWidget {
  final int total;
  const CardInvoice({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 50.h),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                color: ColorConstants.slate[25],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 110.h),
                  Text(
                    formatCurrency(total),
                    style: body1BTextStyle(
                      color: ColorConstants.primary[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "INVOICE #00001",
                    textAlign: TextAlign.center,
                    style: body4TextStyle(),
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    color: ColorConstants.slate[200],
                    height: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        content(
                          "Status",
                          "Belum dibayar",
                        ),
                        content(
                          "Dari",
                          "Livia’s Events\nlivia@event.com\n08118424000",
                        ),
                        content(
                          "Sisa Waktu Bayar",
                          "23:54:50",
                        ),
                        content(
                          "Registration fee",
                          formatCurrency(300000),
                        ),
                        content(
                          "Platform fee",
                          formatCurrency(1000),
                          true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              "assets/icons/invoice-event.png",
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  Widget content(String label, String content, [bool end = false]) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: body5BTextStyle(),
            ),
            Text(
              content,
              textAlign: TextAlign.end,
              style: body5TextStyle(),
            ),
          ],
        ),
        end ? Container() : SizedBox(height: 12.h),
      ],
    );
  }
}
