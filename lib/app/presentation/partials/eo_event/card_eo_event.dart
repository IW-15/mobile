import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/stack_participant.dart';
import 'package:mobile/extensions/string_extension.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/img.dart';

class CardEoEvent extends StatelessWidget {
  final EventModel data;
  const CardEoEvent({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.eoDetailEvent(data.id.toString()));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: ColorConstants.slate[25],
          boxShadow: [ColorConstants.shadow[1]!],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.w),
              child: Image.network(
                img(data.banner),
                height: 110.h,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: data.status == "draft"
                              ? ColorConstants.slate[400]
                              : ColorConstants.primary[400],
                        ),
                        child: Text(
                          data.status.toCapitalized,
                          style: body6TextStyle(
                            size: 8.w,
                            weight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        convertToWIB(data.time),
                        style: body6TextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    data.name,
                    style: body4TextStyle(),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    data.location,
                    style: body6TextStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StackParticipant(),
                      AppButton(
                        onPressed: () {},
                        text: "",
                        color: Colors.yellowAccent,
                        padding: EdgeInsets.zero,
                        child: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
