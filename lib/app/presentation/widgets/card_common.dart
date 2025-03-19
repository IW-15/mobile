import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/extensions/map_indexed.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class CardCommon extends StatelessWidget {
  final String title;
  final Widget child;
  final List<List<String>>? contents;

  const CardCommon({
    super.key,
    required this.title,
    this.contents,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [ColorConstants.shadow[1]!],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              title,
              style: h5BTextStyle(),
            ),
          ),
          Divider(
            color: ColorConstants.slate[300],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: contents != null
                ? Column(
                    children: contents!
                        .mapIndexed((e, i) => field(e[0], e[1],
                            end: i == contents!.length - 1 ? true : false))
                        .toList(),
                  )
                : child,
          ),
        ],
      ),
    );
  }

  Widget field(String label, String content, {bool end = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: body5TextStyle(
            color: ColorConstants.slate[600],
          ),
        ),
        Text(
          content,
          style: body5BTextStyle(
            color: ColorConstants.slate[600],
          ),
        ),
        end ? Container() : SizedBox(height: 16.h),
      ],
    );
  }
}
