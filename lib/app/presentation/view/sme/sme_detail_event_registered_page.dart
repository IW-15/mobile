import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_registered_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/img.dart';

class SmeDetailEventRegisteredPage
    extends GetView<SmeDetailEventRegisteredController> {
  const SmeDetailEventRegisteredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final event = controller.data.value?.event;
          final outlet = controller.data.value?.outlet;

          return Stack(
            children: [
              controller.data.value == null
                  ? Container()
                  : Image.network(
                      img(event!.banner),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                            event?.description ?? "",
                                            style: body5TextStyle(),
                                            textAlign: TextAlign.justify,
                                          ),
                                          SizedBox(height: 20.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color:
                                                    ColorConstants.slate[400],
                                                size: 20.w,
                                              ),
                                              SizedBox(width: 10.w),
                                              controller.data.value == null
                                                  ? Container()
                                                  : Flexible(
                                                      child: Text(
                                                        "${formatDate(event!.date)} ${convertToWIB(event.time)}",
                                                        style: body5TextStyle(),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color:
                                                    ColorConstants.slate[400],
                                                size: 20.w,
                                              ),
                                              SizedBox(width: 10.w),
                                              Flexible(
                                                child: Text(
                                                  event?.location ?? "",
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
                                                color:
                                                    ColorConstants.slate[400],
                                                size: 20.w,
                                              ),
                                              SizedBox(width: 10.w),
                                              Flexible(
                                                child: Text(
                                                  "${event?.pic}\n${event?.picNumber}",
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.store,
                                                color:
                                                    ColorConstants.slate[400],
                                                size: 20.w,
                                              ),
                                              SizedBox(width: 10.w),
                                              Flexible(
                                                child: Text(
                                                  outlet?.name ?? "",
                                                  style: body5BTextStyle(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.link,
                                                color:
                                                    ColorConstants.slate[400],
                                                size: 20.w,
                                              ),
                                              SizedBox(width: 10.w),
                                              Flexible(
                                                child: Text(
                                                  getStatus(controller
                                                          .data.value?.status ??
                                                      ""),
                                                  style: body5BTextStyle(
                                                    color: colorStatus(
                                                      controller.data.value
                                                              ?.status ??
                                                          "",
                                                    ),
                                                  ),
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
                                              tags(event?.venue ?? ""),
                                              tags(event?.category ?? ""),
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
                                      onPressed: (controller
                                                          .data.value?.status ??
                                                      "received") ==
                                                  "rejected" ||
                                              (controller.data.value?.status ??
                                                      "received") ==
                                                  "received"
                                          ? null
                                          : controller.handleSubmit,
                                      text: "Bayar",
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
                        event?.name ?? "",
                        style: h4BTextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String getStatus(String status) {
    switch (status) {
      case "rejected":
        return "Pendaftaran Ditolak";
      case "received":
        return "Menunggu Konfirmasi EO";
      case "waiting":
        return "Menunggu Pembayaran";
      case "accepted":
        return "Pendaftaran Diterima";
      default:
        return "";
    }
  }

  Color colorStatus(String status) {
    switch (status) {
      case "rejected":
        return ColorConstants.error;
      case "received":
        return ColorConstants.primary[400]!;
      case "waiting":
        return ColorConstants.primary[400]!;
      case "accepted":
        return Colors.green;
      default:
        return ColorConstants.slate[600]!;
    }
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
