import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog.CustomAlertDialog({
    super.key,
    required this.widget1,
    required this.widget2,
  });
  final Widget widget1;
  final Widget widget2;

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
              "تم الدفع بنجاح",
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
