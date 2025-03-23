import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/styles/text_styles.dart';

class SmeEventRegisteredPage extends GetView<SmeDetailEventController> {
  const SmeEventRegisteredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "",
        leading: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/event-registered.png",
                    width: 320.w,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Outlet Berhasil Terdaftar",
                    style: h2BTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Selamat! Outlet kamu berhasil mendaftar ke event Livia’s Event! Tunggu pemberitahuan dari penyelenggara event terkait pendaftaranmu. 🚀",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 150.h),
            AppButton(
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
