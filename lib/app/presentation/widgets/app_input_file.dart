import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/filepicker_handler.dart';
import 'package:mobile/utils/show_alert.dart';

typedef ChangeHandler = void Function(File?);

class AppInputFile extends StatelessWidget {
  final List<String> extensions;
  final ChangeHandler onChange;
  final File? file;
  final VoidCallback onRemove;
  final String label;
  const AppInputFile({
    super.key,
    required this.extensions,
    required this.onChange,
    required this.onRemove,
    required this.label,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: body5TextStyle(color: ColorConstants.slate[900]),
        ),
        SizedBox(height: 8.h),
        DottedBorder(
          color: ColorConstants.slate[300]!,
          radius: Radius.circular(8.w),
          dashPattern: [6.w, 4.w],
          strokeWidth: 1.w,
          strokeCap: StrokeCap.round,
          child: GestureDetector(
            onTap: () async {
              try {
                var file = await pickFile(
                  extensions: extensions,
                );
                onChange(file);
              } catch (_) {
                showAlert("Error while uploading flie");
              }
            },
            child: Container(
              height: 100,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Icon(
                    Icons.add_to_drive_outlined,
                    color: ColorConstants.slate[600],
                    size: 28.w,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        file != null
            ? Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  color: ColorConstants.slate[100],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        file!.path.split("/").last,
                        overflow: TextOverflow.ellipsis,
                        style: body5TextStyle(),
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: onRemove,
                      child: Icon(
                        Icons.close,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
