import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/models/event_invitation/event_invitation_model.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_currency.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/img.dart';

class CardInvitation extends StatelessWidget {
  final EventInvitationModel data;
  const CardInvitation({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.detailInvitation(data.id.toString()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.w,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                          img(data.event.banner),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              data.event.name,
                              style: h5BTextStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              data.event.picNumber,
                              style: body5TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.5.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: statusBgColor(),
                          borderRadius: BorderRadius.circular(15.w),
                        ),
                        child: Text(
                          statusText(),
                          style: body5BTextStyle(
                            color: statusColor(),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ColorConstants.primary[50],
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            content("Tanggal", formatDate(data.event.date)),
                            SizedBox(height: 4.h),
                            content("Lokasi", data.event.location),
                          ],
                        ),
                      ),
                      Text(
                        formatCurrency(
                          data.event.tenantPrice,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Color statusBgColor() {
    switch (data.status) {
      case "rejected":
        return Color(0xffFC9898).withOpacity(.75);
      case "accepted":
        return Color(0xffC7FFB7).withOpacity(.53);
      case "pending":
        return ColorConstants.slate[200]!;
      default:
        return ColorConstants.slate[200]!;
    }
  }

  Color statusColor() {
    switch (data.status) {
      case "rejected":
        return Color(0xffC21C1C);
      case "accepted":
        return Color(0xff36B96E);
      case "pending":
        return ColorConstants.slate[900]!;
      default:
        return ColorConstants.slate[900]!;
    }
  }

  String statusText() {
    switch (data.status) {
      case "rejected":
        return "Ditolak";
      case "accepted":
        return "Diterima";
      case "pending":
        return "Menunggu";
      default:
        return "";
    }
  }

  Widget content(String label, String detail) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        label,
        style: body5TextStyle(
          color: ColorConstants.slate[500],
        ),
      ),
      SizedBox(height: 4.h),
      Text(
        detail,
        style: body5TextStyle(
          weight: FontWeight.w500,
        ),
      ),
    ]);
  }
}
