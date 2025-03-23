import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/img.dart';

class CardEventHome extends StatelessWidget {
  final EventModel data;
  const CardEventHome({
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
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              img(data.banner),
              fit: BoxFit.cover,
              width: 1.sw,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(.6),
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.3),
                      Colors.black.withOpacity(.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15.w,
              left: 18.w,
              right: 18.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: h2BTextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "${formatDate(data.date)} ${convertToWIB(data.time)}",
                    style: body6BTextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    data.location,
                    style: body6TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15.w,
              right: 18.w,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.eoEvent);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 5.w,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffE0E5FF),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.chevron_right,
                      color: ColorConstants.primary[500],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
