import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardProfile extends StatelessWidget {
  GlobalController controller = GlobalController.i;
  CardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [ColorConstants.shadow[1]!],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 12.w,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(12.w),
                    width: 24.w,
                    height: 24.w,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.primary[500],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 18.w,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          controller.profile.value?.user.fullName ?? "",
                          style: body4BTextStyle(),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Business Owner",
                          style: body5TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 28.w,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: ColorConstants.primary[500],
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.store,
                            color: ColorConstants.primary[500],
                            size: 24.w,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              controller.profile.value?.merchant.name ?? "",
                              style: body5BTextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              controller.profile.value?.merchant.address ?? "",
                              style: body5TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  AppButton(
                    // color: ColorConstants.primary[300],
                    color: Color(0xff007AFF),
                    width: 1.sw,
                    onPressed: () {},
                    text: "",
                    child: Text(
                      "Lihat link dan Kode QR Toko",
                      style: body4BTextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
