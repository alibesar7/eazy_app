
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.title, this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      width: 80.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff2A72AD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: AppTextStyles.text14,
          )),
    );
  }
}
