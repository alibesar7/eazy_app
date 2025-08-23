

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appStyles.dart';

class Custombtn extends StatelessWidget {
  const Custombtn({
    super.key,
    this.widget,
    this.onPressed,   this.btnColor,
  });
  final Widget? widget;
  final void Function()? onPressed;
  final Color? btnColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor ??const Color(0xff2A72AD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3),
              child: widget,
            ),
            const Spacer(
              flex: 2,
            ),
            const Text(
              "اذهب للدفع",
              style: AppTextStyles.text14,
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ));
  }
}
