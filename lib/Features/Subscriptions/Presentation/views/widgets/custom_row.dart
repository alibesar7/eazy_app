import 'package:esay_app/core/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {super.key,
      required this.text,
      required this.image,
      this.mainAxisAlignmen,
      this.textStyle,
      this.padding});
  final String text;
  final Widget image;
  final MainAxisAlignment? mainAxisAlignmen;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignmen ?? MainAxisAlignment.start,
      children: [
        Text(text,
            style: textStyle),
        Padding(
          padding:padding ?? EdgeInsets.symmetric(horizontal: 1.h),
          child: image,
        )
      ],
    );
  }
}
