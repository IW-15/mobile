import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_dialog.dart';
import 'package:mobile/styles/text_styles.dart';

class ModalInvited extends StatelessWidget {
  const ModalInvited({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: Column(
        children: [
          Image.asset(
            "assets/images/tenant_invited.png",
            width: 200.w,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.h),
          Text(
            "Tenant Berhasil Diundang",
            style: body3BTextStyle(),
          ),
          SizedBox(height: 8.h),
          Text(
            "Tenant berhasil diundang! Mohon tunggu konfirmasi kesediaan dari tenant maksimal 2 X 24 jam.",
            style: body5TextStyle(size: 13.w),
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
