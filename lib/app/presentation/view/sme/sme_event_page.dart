import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_event_controller.dart';
import 'package:mobile/app/presentation/partials/event/card_event_profile.dart';
import 'package:mobile/app/presentation/partials/event/card_event_registered.dart';
import 'package:mobile/app/presentation/widgets/not_found.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class SmeEventPage extends GetView<SmeEventController> {
  const SmeEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Daftar Events",
        action: Icon(
          Icons.notifications,
          color: ColorConstants.primary[500],
        ),
        leading: false,
        child: Obx(
          () => Column(
            children: [
              CardEventProfile(
                eventCount: controller.eventRegistered.length,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.invitation);
                          },
                          child: Container(
                            width: 48.w,
                            height: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstants.primary[500],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Undangan Event",
                          style: body5TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.eventSearch);
                          },
                          child: Container(
                            width: 48.w,
                            height: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstants.primary[500],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Cari Event",
                          style: body5TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Events Terdaftar",
                    style: body3BTextStyle(),
                  ),
                  Icon(
                    Icons.filter_alt,
                    color: ColorConstants.primary[500],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              controller.eventRegistered.isEmpty
                  ? NotFound(
                      title: "Tidak ada data",
                      description: "Anda belum mendaftar ke event manapun",
                    )
                  : Container(),
              ...controller.eventRegistered
                  .map((e) => CardEventRegistered(data: e))
            ],
          ),
        ),
      ),
    );
  }
}
