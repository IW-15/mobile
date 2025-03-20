import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_detail_event_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';

class EoDetailEventPage extends GetView<EoDetailEventController> {
  const EoDetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/event_image_dummy.png",
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
                                          GestureDetector(
                                            onTap: controller.handleEdit,
                                            child: Icon(
                                              Icons.edit,
                                              size: 20.w,
                                              color:
                                                  ColorConstants.primary[500],
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          GestureDetector(
                                            onTap: controller.handleDelete,
                                            child: Icon(
                                              Icons.delete,
                                              size: 20.w,
                                              color: ColorConstants.error,
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
                                        "Livia’s Event adalah tempat berkumpulnya para pecinta kuliner dari berbagai kalangan. Kami menghadirkan berbagai stand makanan yang menyajikan hidangan unik dan autentik dari berbagai penjuru, mulai dari makanan tradisional hingga fusion yang menggugah selera. Temukan berbagai cita rasa mulai dari manis, pedas, hingga gurih yang akan memanjakan selera Anda.\n\nTidak hanya itu, Anda juga dapat menikmati program menarik seperti demo memasak, sesi tanya jawab dengan koki terkemuka, dan berbagai permainan interaktif dengan hadiah menarik. Bawa serta teman dan keluarga Anda untuk menikmati momen kebersamaan sambil menjelajahi ragam kuliner yang ditawarkan.",
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
                                            child: Text(
                                              "30 April 2025 19.00 WIB",
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
                                              "Jl. Prof. Dr. HR Boenyamin BWK II, Kabupaten Banyumas, Jawa Tengah",
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
                                              "Livia\n081222323234",
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      content(
                                          "Estimasi Jumlah\nPengunjung", "200"),
                                      content("Biaya Tenant",
                                          formatCurrency(500000)),
                                      Text(
                                        "Tags",
                                        style: body5BTextStyle(),
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          tags("Indoor"),
                                          tags("Bazaar"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.w),
                            child: AppButton(
                              width: 1.sw,
                              onPressed: controller.handlePublikasi,
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
                    "Livia's Event",
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
