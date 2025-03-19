import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/filepicker_handler.dart';
import 'package:mobile/utils/show_alert.dart';

typedef ChangeHandler = void Function(File?);

class AppInputFile extends StatefulWidget {
  final List<String> extensions;
  final ChangeHandler onChange;
  final File? file;
  final VoidCallback onRemove;
  final String label;
  final String? hint;
  final String? error;

  const AppInputFile({
    super.key,
    required this.extensions,
    required this.label,
    required this.onChange,
    required this.onRemove,
    this.file,
    this.hint,
    this.error,
  });

  @override
  State<AppInputFile> createState() => _AppInputFileState();
}

class _AppInputFileState extends State<AppInputFile> {
  GlobalKey<FormFieldState> inputKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      key: inputKey,
      autovalidateMode: AutovalidateMode.always,
      validator: (e) {
        if (widget.file == null) {
          return widget.error ?? "${widget.label} tidak boleh kosong";
        }
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.label,
              style: body5TextStyle(color: ColorConstants.slate[900]),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                boxShadow: state.errorText != null
                    ? [
                        BoxShadow(
                          color: ColorConstants.error.withOpacity(0.4),
                          offset: Offset(0, 0),
                          blurRadius: 4,
                        ),
                      ]
                    : [],
              ),
              child: DottedBorder(
                color: state.errorText != null
                    ? ColorConstants.error
                    : ColorConstants.slate[300]!,
                radius: Radius.circular(8.w),
                dashPattern: [6.w, 4.w],
                strokeWidth: 1.w,
                strokeCap: StrokeCap.round,
                child: GestureDetector(
                  onTap: () async {
                    try {
                      var file = await pickFile(
                        extensions: widget.extensions,
                      );
                      widget.onChange(file);
                      inputKey.currentState!.validate();
                    } catch (_) {
                      showAlert("Error while uploading flie");
                    }
                  },
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    child: widget.file != null
                        ? Row(
                            children: [
                              SizedBox(width: 20.w),
                              SvgPicture.asset(
                                "assets/icons/document.svg",
                                width: 25.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 18.w),
                              Flexible(
                                child: Text(
                                  widget.file!.path.split("/").last,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: h5TextStyle(),
                                ),
                              ),
                              SizedBox(width: 20.w),
                            ],
                          )
                        : Center(
                            child: SvgPicture.asset(
                              "assets/icons/add_file.svg",
                              width: 28.w,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                state.errorText != null
                                    ? ColorConstants.error
                                    : ColorConstants.slate[400]!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            widget.file != null
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
                            widget.file!.path.split("/").last,
                            overflow: TextOverflow.ellipsis,
                            style: body5TextStyle(),
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            widget.onRemove();
                            inputKey.currentState!.validate();
                          },
                          child: Icon(
                            Icons.close,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            state.errorText != null
                ? Text(
                    state.errorText ?? "",
                    style: body5BTextStyle(
                      color: Colors.red[400],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : widget.hint != null
                    ? Text(
                        widget.hint!,
                        style: body5TextStyle(
                          color: ColorConstants.slate[600],
                        ),
                      )
                    : Container(),
          ],
        );
      },
    );
  }
}
