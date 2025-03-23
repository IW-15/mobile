import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_dialog.dart';
import 'package:mobile/styles/text_styles.dart';

class ModalConfirmTenant extends StatelessWidget {
  final bool isAccept;
  final String name;

  const ModalConfirmTenant({
    super.key,
    required this.isAccept,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: Column(
        children: [
          Image.asset(
            isAccept
                ? "assets/images/tenant_invited.png"
                : "assets/images/tenant_rejected.png",
            width: 200.w,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.h),
          Text(
            "Permohonan Tenant ${isAccept ? "Diterima" : "Ditolak"}",
            style: body3BTextStyle(),
          ),
          SizedBox(height: 8.h),
          RichText(
            text: TextSpan(
              text: "Permohonan Tenant $name telah ",
              style: body5TextStyle(size: 13.w),
              children: [
                TextSpan(
                  text: isAccept ? "diterima! " : "ditolak! ",
                  style: body5BTextStyle(size: 13.w),
                ),
                TextSpan(
                  text: isAccept
                      ? "Jangan lupa lakukan komunikasi dengan tenant melalui kontak yang tertera."
                      : "Apresiasi permohonan tenant dengan menyampaikan feedback melalui kontak tertera.",
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          AppButton(
            onPressed: () {
              Get.back();
            },
            text: "OK",
            textStyle: body3BTextStyle(color: Colors.white, size: 13.w),
            width: 1.sw,
          ),
        ],
      ),
    );
  }
}
