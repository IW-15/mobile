import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/extensions/map_indexed.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class AppBottomBar extends StatelessWidget {
  final String route;
  const AppBottomBar({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "bottom_bar",
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          boxShadow: [
            ColorConstants.shadow[1]!,
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.w),
            topRight: Radius.circular(15.w),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...[
              [AppRoute.home, "assets/icons/home.svg", "Home"],
              [AppRoute.login, "assets/icons/belanja.svg", "Belanja"],
              [AppRoute.login, "assets/icons/katalog.svg", "Katalog"],
              [AppRoute.talangan, "assets/icons/talangan.svg", "Talangan"],
              [AppRoute.setting, "assets/icons/setting.svg", "Setting"],
            ].mapIndexed(
              (e, i) => GestureDetector(
                onTap: () {
                  if (i == 1 || i == 2) {
                    return;
                  }
                  if (i == 0 || i == 4) {
                    Get.toNamed(e[0]);
                    return;
                  }

                  if (i == 3 &&
                      GlobalController.i.merchant.value?.ktp != null) {
                    Get.toNamed(e[0]);
                    return;
                  }

                  Get.toNamed(AppRoute.loanOnboard);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      e[1],
                      width: 24.w,
                      colorFilter: route == e[0]
                          ? ColorFilter.mode(
                              ColorConstants.primary[500]!,
                              BlendMode.srcIn,
                            )
                          : null,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      e[2],
                      style: body5TextStyle(
                        weight: FontWeight.w500,
                        color: route == e[0]
                            ? ColorConstants.primary[500]
                            : ColorConstants.slate[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
