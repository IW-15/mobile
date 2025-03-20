import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_detail_event_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class EoEventPublishPage extends GetView<EoDetailEventController> {
  const EoEventPublishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "",
        leading: false,
        child: Column(
          children: [
            Expanded(child: Container()),
            Image.asset(
              "assets/images/event_published.png",
              width: 310.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 12.h),
            Text(
              "Event Dipublikasikan",
              style: h2BTextStyle(),
            ),
            SizedBox(height: 12.h),
            Text(
              "Selamat! Event Sedaap Bazaar telah dipublikasikan. Saatnya mengundang tenant!",
              style: body4TextStyle(
                color: ColorConstants.slate[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              "Thank You!",
              style: body3BTextStyle(
                color: ColorConstants.primary[500],
              ),
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
