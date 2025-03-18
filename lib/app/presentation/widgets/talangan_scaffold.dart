import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class TalanganScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool leading;
  const TalanganScaffold({
    super.key,
    required this.title,
    required this.child,
    this.leading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -400.h,
          left: -450.w,
          child: Image.asset(
            "assets/images/talangan_bg.png",
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Expanded(
              child: ScrollableConstraints(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: child,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: leading ? 0.w : -28.w,
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  iconSize: 22.sp,
                  onPressed: () {
                    Get.back();
                  },
                  icon: leading
                      ? Icon(
                          Icons.chevron_left,
                          size: 26.w,
                          color: ColorConstants.primary[500],
                        )
                      : Container(),
                ),
                SizedBox(width: 4.w),
                Text(
                  title,
                  style: h4BTextStyle(
                    color: ColorConstants.primary[500],
                    size: leading ? 16.sp : 18.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
