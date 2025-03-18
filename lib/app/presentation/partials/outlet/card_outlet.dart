import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardOutlet extends StatelessWidget {
  final OutletModel data;
  const CardOutlet({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.outletDetail(data.id.toString()));
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(bottom: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [ColorConstants.shadow[1]!],
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: ColorConstants.primary[500]!),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Icon(
                    Icons.storefront_rounded,
                    color: ColorConstants.primary[500],
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        data.name,
                        style: h5BTextStyle(),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        data.address,
                        style: body5TextStyle(color: ColorConstants.slate[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "MID: MID-${data.id}",
                        style:
                            body5BTextStyle(color: ColorConstants.slate[600]),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "No. Rekening: *********7446",
                        style: body5TextStyle(color: ColorConstants.slate[600]),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "For More",
                                style: body5TextStyle(
                                  color: ColorConstants.primary[500],
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.chevron_right,
                                color: ColorConstants.primary[500],
                                size: 18.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
