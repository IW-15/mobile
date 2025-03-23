import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/controller/eo/eo_available_tenants_controller.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/partials/eo_event/modal_detail_tenant.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/show_alert.dart';

class CardAvailableTenant extends StatelessWidget {
  final OutletModel data;
  const CardAvailableTenant({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          showDialog(
            context: context,
            builder: (context) => ModalDetailTenant(
              data: data,
              onSubmit: (e) {
                EoAvailableTenantsController.i.handleInvite(e.id.toString());
              },
            ),
          );
        } catch (error) {
          showAlert(error.toString());
        }
      },
      child: Container(
        width: 150.w,
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.w),
        decoration: BoxDecoration(
          color: ColorConstants.slate[25],
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "assets/images/outlet_dummy.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.w),
            Text(
              data.name,
              style: body6BTextStyle(),
            ),
            SizedBox(height: 5.w),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 8.w,
                  color: data.eventOpen ? Colors.green : Color(0xffDF3E60),
                ),
                SizedBox(width: 4.w),
                Flexible(
                  child: Text(
                    "${data.eventOpen ? "" : "Tidak "}Menerima undangan event",
                    style: body6TextStyle(
                      size: 9.w,
                      color: data.eventOpen ? Colors.green : Color(0xffDF3E60),
                      weight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              data.type,
              textAlign: TextAlign.start,
              style: body6TextStyle(
                size: 9.w,
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              data.address,
              overflow: TextOverflow.ellipsis,
              style: body6TextStyle(size: 8.w),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 2.h),
            Text(
              "${data.phone} | ${data.email}",
              style: body6TextStyle(size: 8.w),
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
