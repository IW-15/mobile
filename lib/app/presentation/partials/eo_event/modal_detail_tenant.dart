import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class ModalDetailTenant extends StatelessWidget {
  final OutletModel data;
  final bool isRegistered;
  final Function(OutletModel data) onSubmit;
  final Function(OutletModel data)? onAccept;
  final Function(OutletModel data)? onReject;

  const ModalDetailTenant({
    super.key,
    required this.data,
    required this.onSubmit,
    this.onAccept,
    this.onReject,
    this.isRegistered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.w,
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.w),
                  child: Image.asset(
                    "assets/images/outlet_dummy.jpg",
                    width: 1.sw,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  data.name,
                  style: body3BTextStyle(),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(
                      width: 32.w,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.circle,
                          color: data.eventOpen
                              ? Colors.green
                              : ColorConstants.error,
                          size: 12.w,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "${data.eventOpen ? "" : "Tidak "}Menerima undangan event",
                        style: body5TextStyle(
                          size: 13.w,
                          color: data.eventOpen
                              ? Colors.green
                              : ColorConstants.error,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(
                      width: 32.w,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.category,
                          size: 16.w,
                          color: ColorConstants.slate[500],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        data.type,
                        style: body5TextStyle(
                          size: 13.w,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 32.w,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.location_on,
                          size: 16.w,
                          color: ColorConstants.slate[500],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        data.address,
                        style: body5TextStyle(
                          size: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 32.w,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.phone,
                          size: 16.w,
                          color: ColorConstants.slate[500],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        data.phone,
                        style: body5TextStyle(
                          size: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 32.w,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.email,
                          size: 16.w,
                          color: ColorConstants.slate[500],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        data.email,
                        style: body5TextStyle(
                          size: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                isRegistered
                    ? Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              onPressed: onAccept != null
                                  ? () {
                                      onAccept!(data);
                                    }
                                  : null,
                              text: "Terima",
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: AppButton(
                              onPressed: onReject != null
                                  ? () {
                                      onReject!(data);
                                    }
                                  : null,
                              text: "Tolak",
                              color: ColorConstants.error,
                            ),
                          ),
                        ],
                      )
                    : AppButton(
                        width: 1.sw,
                        onPressed: data.eventOpen
                            ? () {
                                onSubmit(data);
                              }
                            : null,
                        variant: AppButtonVariant.secondary,
                        text: "Undang"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
