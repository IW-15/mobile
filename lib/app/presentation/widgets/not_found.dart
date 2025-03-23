import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/text_styles.dart';

class NotFound extends StatelessWidget {
  final String title;
  final String description;
  final bool small;

  const NotFound({
    super.key,
    required this.title,
    required this.description,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/not-found.png",
          width: 250.w, // Adjusted with ScreenUtil for responsive design
          fit: BoxFit.cover,
        ),
        SizedBox(height: 12.h), // Space between image and text
        Text(
          title,
          style: small
              ? body4BTextStyle()
              : body3BTextStyle(), // Assuming body4BTextStyle is defined
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h), // Space between title and description
        Text(
          description,
          style: small
              ? body5TextStyle()
              : body4TextStyle(), // Assuming body4TextStyle is defined
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
