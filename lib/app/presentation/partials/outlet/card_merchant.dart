import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardMerchant extends StatelessWidget {
  final MerchantModel data;
  const CardMerchant({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [ColorConstants.shadow[1]!],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              "Informasi Merchant",
              style: h5BTextStyle(),
            ),
          ),
          Divider(
            color: ColorConstants.slate[300],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                field("Nama", data.name),
                field("Alamat Kantor Pusat", data.address),
                field("No. Telp", data.phone),
                field("Email", data.email, end: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget field(String label, String content, {bool end = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: body5TextStyle(
            color: ColorConstants.slate[600],
          ),
        ),
        Text(
          content,
          style: body5BTextStyle(
            color: ColorConstants.slate[600],
          ),
        ),
        end ? Container() : SizedBox(height: 16.h),
      ],
    );
  }
}
