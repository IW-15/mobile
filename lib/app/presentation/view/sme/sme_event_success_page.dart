import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme_detail_event_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class SmeEventSuccessPage extends GetView<SmeDetailEventController> {
  const SmeEventSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        leading: false,
        title: "",
        child: Column(
          children: [
            Expanded(child: Container()),
            Image.asset(
              "assets/images/payment_success.png",
              width: 240.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.h),
            Text(
              "Pembayaran Berhasil",
              style: h2BTextStyle(),
            ),
            SizedBox(height: 14.h),
            Text(
              "Kamu telah membayar untuk event Livia’s Kitchen. Selamat berjualan!",
              style: body4TextStyle(
                color: ColorConstants.slate[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              "Thank You!",
              style: body2BTextStyle(color: ColorConstants.primary[500]),
            ),
            Expanded(flex: 2, child: Container()),
            AppButton(
              width: 1.sw,
              onPressed: () {
                Get.back();
              },
              text: "Kembali",
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
