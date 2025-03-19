import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/text_styles.dart';

typedef OnChange = void Function(String val, int index);

class OtpInput extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final int index;
  final OnChange onChange;
  final bool isLast;
  final double size;
  final double margin;

  OtpInput({
    super.key,
    required this.index,
    required this.onChange,
    this.isLast = false,
    this.size = 0,
    this.margin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin == 0 ? 5.w : margin),
        height: size == 0 ? 40.w : size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.4),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(.45),
              offset: Offset(4.w, 6.h),
              blurRadius: 2.w,
              spreadRadius: 4.w,
            ),
          ],
        ),
        child: Center(
          child: TextField(
            textInputAction:
                isLast ? TextInputAction.done : TextInputAction.next,
            controller: controller,
            onChanged: (e) {
              onChange(controller.text, index);

              if (e.length == 1) {
                if (isLast) {
                  FocusScope.of(context).unfocus();
                  return;
                }
                FocusScope.of(context).nextFocus();
              } else if (e.isEmpty) {
                if (index != 0) {
                  FocusScope.of(context).previousFocus();
                } else {
                  FocusScope.of(context).unfocus();
                }
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            style: h3BTextStyle(height: 1),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(1),
            ],
          ),
        ),
      ),
    );
  }
}
