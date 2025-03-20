import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/stack_participant.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardEoEvent extends StatelessWidget {
  const CardEoEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.eoDetailEvent("5"));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: ColorConstants.slate[25],
          boxShadow: [ColorConstants.shadow[1]!],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.w),
              child: Image.asset(
                "assets/images/event_image_dummy.png",
                height: 110.h,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: ColorConstants.primary[400],
                        ),
                        child: Text(
                          "On Going",
                          style: body6TextStyle(
                            size: 8.w,
                            weight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "10.00 WIB",
                        style: body6TextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "Livia’s Bazaar: Soy Day",
                    style: body4TextStyle(),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Banjarmasin, Kalimantan Selatan",
                    style: body6TextStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StackParticipant(),
                      AppButton(
                        onPressed: () {},
                        text: "",
                        color: Colors.yellowAccent,
                        padding: EdgeInsets.zero,
                        child: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
