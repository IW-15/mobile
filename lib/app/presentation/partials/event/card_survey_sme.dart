import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardSurveySme extends StatelessWidget {
  const CardSurveySme({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.w,
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/survey-event.png",
                  width: 280.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Survey UMKM",
                  style: body4BTextStyle(),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Dari mana kamu mengetahui informasi mengenai event ini?",
                  style: body5TextStyle(
                    color: ColorConstants.slate[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 6.w,
                  alignment: WrapAlignment.center,
                  spacing: 8.w,
                  children: [
                    CardSurveySmeTag(text: "Livin' Merchant"),
                    CardSurveySmeTag(text: "Instagram"),
                    CardSurveySmeTag(text: "Facebook"),
                    CardSurveySmeTag(text: "Berita"),
                    CardSurveySmeTag(text: "Referral"),
                    CardSurveySmeTag(text: "LinkedIn"),
                    CardSurveySmeTag(text: "Lainnya"),
                  ],
                ),
                SizedBox(height: 20.h),
                AppButton(
                  width: 1.sw,
                  onPressed: SmeDetailEventController.i.handleRegis,
                  text: "Kirim",
                  textStyle: body4BTextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardSurveySmeTag extends StatefulWidget {
  final String text;
  const CardSurveySmeTag({
    super.key,
    required this.text,
  });

  @override
  State<CardSurveySmeTag> createState() => _CardSurveySmeTagState();
}

class _CardSurveySmeTagState extends State<CardSurveySmeTag> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          active = !active;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 3.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: active
                ? ColorConstants.primary[500]!
                : ColorConstants.slate[300]!,
            width: active ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Text(
          widget.text,
          style: body5TextStyle(
            color: active
                ? ColorConstants.primary[500]
                : ColorConstants.slate[700],
            weight: active ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
