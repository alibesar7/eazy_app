
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../appStyles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.widget1,
    required this.widget2, required this.title,
  });
  final Widget widget1;
  final Widget widget2;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: SizedBox(
        height: 25.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widget1,
            SizedBox(
              height: 1.h,
            ),
            Text(
              title,
              style: AppTextStyles.text16,
            ),
            SizedBox(height: .5.h),
            SizedBox(
              width: double.infinity,
              child: widget2,
            )
          ],
        ),
      ),
    );
  }
}
