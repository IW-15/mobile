import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/extensions/map_indexed.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/show_alert.dart';

class AppBottomBar extends StatelessWidget {
  final String route;
  final bool isSme;

  AppBottomBar({
    super.key,
    required this.route,
    this.isSme = true,
  });

  final sme = [
    [AppRoute.home, "assets/icons/home.svg", "Home"],
    [AppRoute.login, "assets/icons/belanja.svg", "Belanja"],
    [AppRoute.login, "assets/icons/katalog.svg", "Katalog"],
    [AppRoute.talangan, "assets/icons/event.svg", "Event"],
    [AppRoute.setting, "assets/icons/setting.svg", "Setting"],
  ];

  final eo = [
    [AppRoute.home, "assets/icons/home.svg", "Home"],
    [AppRoute.eoEvent, "assets/icons/event.svg", "Event"],
    [AppRoute.login, "assets/icons/katalog.svg", "Katalog"],
    [AppRoute.talangan, "assets/icons/store.svg", "Tenant"],
    [AppRoute.setting, "assets/icons/setting.svg", "Setting"],
  ];

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
            ...(isSme ? sme : eo).mapIndexed(
              (e, i) {
                if (!isSme && i == 2) {
                  return GestureDetector(
                    onTap: () {
                      showAlert("LAHHH");
                      Get.toNamed(AppRoute.eoCreateEvent);
                    },
                    child: Container(
                      width: 46.w,
                      height: 46.w,
                      decoration: BoxDecoration(
                        color: ColorConstants.primary[100],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: ColorConstants.primary[500],
                          size: 32.w,
                        ),
                      ),
                    ),
                  );
                }
                return GestureDetector(
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
