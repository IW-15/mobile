import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/controller/eo/eo_registered_tenants_controller.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/presentation/partials/eo_event/modal_detail_tenant.dart';
import 'package:mobile/app/presentation/widgets/app_checkbox.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardRegisteredTenant extends StatelessWidget {
  final bool value;
  final Function(bool val) onChange;
  final EventRegisteredModel data;

  const CardRegisteredTenant({
    super.key,
    required this.value,
    required this.onChange,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(!value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
        margin: EdgeInsets.only(bottom: 8.w),
        decoration: BoxDecoration(
          color: value
              ? ColorConstants.primary[100]!.withOpacity(.2)
              : ColorConstants.slate[25],
          borderRadius: BorderRadius.circular(10.w),
          border: Border(
            bottom: BorderSide(
              color: ColorConstants.primary[200]!,
              width: 2.w,
            ),
            right: BorderSide(color: ColorConstants.primary[200]!),
          ),
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppCheckbox(
                        value: value,
                        onChange: (e) {
                          onChange(e);
                        },
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        data.outlet.name,
                        style: body5BTextStyle(
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Text(
                      "${data.score == "high" ? "High" : data.score == "medium" ? "Mid" : "Low"} Recommendation",
                      style: body6BTextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        data.outlet.type,
                        style: body6BTextStyle(
                          color: ColorConstants.slate[600],
                        ),
                      ),
                      Flexible(
                        child: Text(
                          " | ${data.outlet.phone} | ${data.outlet.email}",
                          style: body6TextStyle(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => ModalDetailTenant(
                              data: data.outlet,
                              isRegistered: true,
                              onSubmit: (e) {},
                              onAccept:
                                  EoRegisteredTenantsController.i.handleAccept,
                              onReject:
                                  EoRegisteredTenantsController.i.handleReject,
                            ));
                  },
                  child: Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorConstants.error,
                        width: 2.w,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 16.w,
                        color: ColorConstants.error,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => ModalDetailTenant(
                              data: data.outlet,
                              isRegistered: true,
                              onSubmit: (e) {},
                              onAccept:
                                  EoRegisteredTenantsController.i.handleAccept,
                              onReject:
                                  EoRegisteredTenantsController.i.handleReject,
                            ));
                  },
                  child: Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.greenAccent,
                        width: 2.w,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 16.w,
                        color: Colors.greenAccent,
                      ),
                    ),
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
