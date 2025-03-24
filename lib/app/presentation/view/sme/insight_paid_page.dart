import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class InsightPaidPage extends StatefulWidget {
  const InsightPaidPage({super.key});

  @override
  State<InsightPaidPage> createState() => _InsightPaidPageState();
}

class _InsightPaidPageState extends State<InsightPaidPage> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          loading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        leading: false,
        title: '',
        child: Column(
          children: [
            Image.asset(
              "assets/images/insight_paid.png",
              width: 281.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.h),
            Text(
              "Pembayaran\nBerhasil",
              style: h1BTextStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "Kamu telah membayar premium untuk post-event insight. Insight sedang dibuat, mohon tunggu sebentar.",
                style: body3TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Thank You!",
              style: body3TextStyle(
                weight: FontWeight.w600,
                color: ColorConstants.primary[500],
              ),
            ),
            SizedBox(height: 16.h),
            loading ? CircularProgressIndicator() : Container(),
            Expanded(child: Container()),
            !loading
                ? Column(
                    children: [
                      AppButton(
                        width: 1.sw,
                        onPressed: () {
                          Get.toNamed(AppRoute.insight);
                        },
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        text: "",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/insight.svg",
                              height: 24.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Post-Event Insight",
                              style: body3BTextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AppButton(
                        variant: AppButtonVariant.secondary,
                        width: 1.sw,
                        onPressed: () {
                          Get.back();
                        },
                        text: "Kembali",
                      ),
                      SizedBox(height: 20.h),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
