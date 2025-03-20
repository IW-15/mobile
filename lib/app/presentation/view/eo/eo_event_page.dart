import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_event_controller.dart';
import 'package:mobile/app/presentation/partials/eo_event/card_filter_tag.dart';
import 'package:mobile/app/presentation/partials/eo_event/eo_date_categorical_event.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/text_styles.dart';

class EoEventPage extends GetView<EoEventController> {
  const EoEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        route: AppRoute.talangan,
        isSme: false,
      ),
      body: TalanganScaffold(
        scroll: false,
        title: "Events",
        leading: false,
        child: Obx(
          () => Column(
            children: [
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...[
                      ["All\nEvents", "all"],
                      ["Sedang\nBerlangsung", "progress"],
                      ["Mendatang\n", "coming_soon"],
                      ["Draft\n", "draft"]
                    ].map(
                      (List<String> e) => CardFilterTag(
                        label: e[0],
                        value: e[1],
                        current: controller.filter.value,
                        onChange: (e) {
                          controller.filter.value = e;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daftar event",
                    style: body3BTextStyle(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 3.w,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffDCE4FC),
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Date",
                          style: body5TextStyle(
                            weight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.arrow_downward,
                          size: 14.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.w),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EoDateCategoricalEvent(),
                      EoDateCategoricalEvent(),
                      EoDateCategoricalEvent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
