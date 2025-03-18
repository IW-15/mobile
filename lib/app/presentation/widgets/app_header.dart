import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/styles/text_styles.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? leading;
  final Widget? leadingWidget;
  final bool back;
  final Color? background;

  const AppHeader({
    super.key,
    required this.title,
    this.leading,
    this.leadingWidget,
    this.back = true,
    this.background = Colors.transparent,
  });

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: background ?? Colors.white,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Stack(
          children: [
            back
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      iconSize: 22.sp,
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 26.w,
                      ),
                    ),
                  )
                : Container(),
            leadingWidget != null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        leadingWidget!,
                        SizedBox(width: 12),
                      ],
                    ),
                  )
                : Container(),
            leading != null && leadingWidget == null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      iconSize: 24,
                      splashRadius: 24,
                      onPressed: leading,
                      icon: Icon(Icons.more_vert),
                    ),
                  )
                : Container(),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: 56.w),
                  Text(
                    title,
                    style: h4BTextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
