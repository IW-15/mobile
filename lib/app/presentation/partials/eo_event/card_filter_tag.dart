import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

typedef OnchangeCallback = Function(String);

class CardFilterTag extends StatefulWidget {
  final String label;
  final String value;
  final String current;
  final OnchangeCallback onChange;

  const CardFilterTag({
    super.key,
    required this.label,
    required this.value,
    required this.current,
    required this.onChange,
  });

  @override
  State<CardFilterTag> createState() => _CardFilterTagState();
}

class _CardFilterTagState extends State<CardFilterTag> {
  @override
  Widget build(BuildContext context) {
    bool isActive = widget.value == widget.current;

    return GestureDetector(
      onTap: () {
        widget.onChange(widget.value);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 140.w,
        margin: EdgeInsets.only(right: 7.w),
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 11.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: isActive
              ? ColorConstants.primary[400]
              : ColorConstants.slate[200],
          border: Border.all(
            color: isActive ? Colors.white : ColorConstants.slate[400]!,
          ),
          boxShadow: [ColorConstants.shadow[1]!],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: h5BTextStyle(
                color: isActive ? Colors.white : ColorConstants.slate[400],
              ),
            ),
            Divider(
              height: 22.w,
              color: isActive ? Colors.white : ColorConstants.slate[400],
            ),
            Text(
              "5 events",
              style: body5TextStyle(
                color: isActive ? Colors.white : ColorConstants.slate[400],
              ),
            )
          ],
        ),
      ),
    );
  }
}
