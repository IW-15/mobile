import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_detail_event_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/img.dart';

class EoDetailEventPage extends GetView<EoDetailEventController> {
  const EoDetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            controller.data.value == null
                ? Container(
                    height: .4.sh,
                  )
                : Image.network(
                    img(controller.data.value!.banner),
                    height: .4.sh,
                    fit: BoxFit.cover,
                    width: 1.sw,
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              offset: Offset(0, -10),
                              spreadRadius: 10.w,
                              blurRadius: 40.w,
                            )
                          ],
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
                                        Row(
                                          children: [
                                            (controller.data.value?.status ??
                                                        "published") ==
                                                    "published"
                                                ? Container()
                                                : GestureDetector(
                                                    onTap:
                                                        controller.handleEdit,
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 20.w,
                                                      color: ColorConstants
                                                          .primary[500],
                                                    ),
                                                  ),
                                            SizedBox(width: 4.w),
                                            (controller.data.value?.status ??
                                                        "published") ==
                                                    "published"
                                                ? Container()
                                                : GestureDetector(
                                                    onTap:
                                                        controller.handleDelete,
                                                    child: Icon(
                                                      Icons.delete,
                                                      size: 20.w,
                                                      color:
                                                          ColorConstants.error,
                                                    ),
                                                  ),
                                          ],
                                        )
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
                                            Flexible(
                                                child: controller.data.value !=
                                                        null
                                                    ? Text(
                                                        "${formatDate(controller.data.value!.date)} ${controller.data.value!.time} WIB",
                                                        style: body5TextStyle(),
                                                      )
                                                    : Container()),
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
                                                "${controller.data.value?.pic ?? ""}\n${controller.data.value?.picNumber ?? ""}",
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        content(
                                          "Estimasi Jumlah\nPengunjung",
                                          (controller.data.value
                                                      ?.visitorNumber ??
                                                  0)
                                              .toString(),
                                        ),
                                        content(
                                            "Biaya Tenant",
                                            formatCurrency(controller
                                                    .data.value?.tenantPrice ??
                                                0)),
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
                              child: (controller.data.value?.status ??
                                          "draft") ==
                                      "published"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        [Icons.mail, "Undang Tenant"],
                                        [Icons.store, "List Tenant"]
                                      ]
                                          .map(
                                            (e) => GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 50.w,
                                                    height: 50.w,
                                                    decoration: BoxDecoration(
                                                      color: ColorConstants
                                                          .primary[500],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        e[0] as IconData,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    e[1] as String,
                                                    style: body4TextStyle(
                                                      color: ColorConstants
                                                          .slate[700],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList())
                                  : AppButton(
                                      width: 1.sw,
                                      onPressed:
                                          (controller.data.value?.status ??
                                                      "published") ==
                                                  "published"
                                              ? null
                                              : controller.handlePublikasi,
                                      text: "Publikasi Event",
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

  Widget content(String label, String content, [bool end = false]) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: body5BTextStyle(),
            ),
            Text(
              content,
              textAlign: TextAlign.end,
              style: body5TextStyle(),
            ),
          ],
        ),
        end ? Container() : SizedBox(height: 12.h),
      ],
    );
  }
}
