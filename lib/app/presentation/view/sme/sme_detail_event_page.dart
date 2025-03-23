import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_controller.dart';
import 'package:mobile/app/controller/sme/sme_event_controller.dart';
import 'package:mobile/app/presentation/partials/event/card_event_confirm_regist.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/img.dart';

class SmeDetailEventPage extends GetView<SmeDetailEventController> {
  const SmeDetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            controller.data.value == null
                ? Container()
                : Image.network(
                    img(controller.data.value!.banner),
                    height: .4.sh,
                    fit: BoxFit.cover,
                    width: 1.sw,
                  ),
            Container(
              width: 1.sw,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConstants.slate[800]!.withOpacity(.8),
                    ColorConstants.slate[800]!.withOpacity(.2),
                    ColorConstants.slate[800]!.withOpacity(0),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: ScrollableConstraints(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: .25.sh),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.slate[100],
                          borderRadius: BorderRadius.circular(15.w),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.slate[25],
                                borderRadius: BorderRadius.circular(15.w),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 16.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Deskripsi Event",
                                          style: body4BTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 2,
                                    color: ColorConstants.slate[200],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          controller.data.value?.description ??
                                              "",
                                          style: body5TextStyle(),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: ColorConstants.slate[400],
                                              size: 20.w,
                                            ),
                                            SizedBox(width: 10.w),
                                            controller.data.value == null
                                                ? Container()
                                                : Flexible(
                                                    child: Text(
                                                      "${formatDate(controller.data.value!.date)} ${convertToWIB(controller.data.value!.time)}",
                                                      style: body5TextStyle(),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: ColorConstants.slate[400],
                                              size: 20.w,
                                            ),
                                            SizedBox(width: 10.w),
                                            Flexible(
                                              child: Text(
                                                controller
                                                        .data.value?.location ??
                                                    "",
                                                style: body5TextStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: ColorConstants.slate[400],
                                              size: 20.w,
                                            ),
                                            SizedBox(width: 10.w),
                                            Flexible(
                                              child: Text(
                                                "${controller.data.value?.pic}\n${controller.data.value?.picNumber}",
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          "Partisipan",
                                          style: body5BTextStyle(),
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              width: 28.w,
                                              height: 28.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffFFE14B),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "LE",
                                                  style: body6BTextStyle(
                                                    color: ColorConstants
                                                        .primary[500],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              width: 28.w,
                                              height: 28.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffFFE14B),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "LE",
                                                  style: body6BTextStyle(
                                                    color: ColorConstants
                                                        .primary[500],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              width: 28.w,
                                              height: 28.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffFFE14B),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "LE",
                                                  style: body6BTextStyle(
                                                    color: ColorConstants
                                                        .primary[500],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              "+10 registered",
                                              style: body6BTextStyle(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        Text(
                                          "Tags",
                                          style: body5BTextStyle(),
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          children: [
                                            tags(controller.data.value?.venue ??
                                                ""),
                                            tags(controller
                                                    .data.value?.category ??
                                                ""),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Column(
                                children: [
                                  SizedBox(height: 12.h),
                                  AppButton(
                                    width: 1.sw,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CardEventConfirmRegist(
                                          outlets: SmeEventController.i.outlets,
                                        ),
                                      );
                                    },
                                    text: "Ikuti Event",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 22.sp,
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 26.w,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      controller.data.value?.name ?? "",
                      style: h4BTextStyle(
                        color: Colors.white,
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

  Widget tags(String text) {
    return Container(
      margin: EdgeInsets.only(
        right: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(
          color: ColorConstants.slate[300]!,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 6.h,
      ),
      child: Text(
        text,
        style: body6TextStyle(
          color: ColorConstants.slate[700],
          height: 1,
        ),
      ),
    );
  }
}
