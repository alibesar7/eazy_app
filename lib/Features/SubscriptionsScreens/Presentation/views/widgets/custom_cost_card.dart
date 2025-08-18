

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/appStyles.dart';

class CustomCostWidget extends StatelessWidget {
  const CustomCostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF9F9F9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("التكلفة",
                    style: AppTextStyles.text16
                        .copyWith(color: Color(0xffA4ACAD))),
                Text("70 د.ل",
                    style: AppTextStyles.text16.copyWith(fontSize: 14),
                    textDirection: TextDirection.rtl)
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("الضريبة المضافة",
                    style: AppTextStyles.text16
                        .copyWith(color: Color(0xffA4ACAD))),
                Text("0 د.ل",
                    style: AppTextStyles.text16.copyWith(fontSize: 14),
                    textDirection: TextDirection.rtl)
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Divider(
              color: Color(0xffC1C1C1),
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("المجموع  ",
                    style: AppTextStyles.text16
                        .copyWith(color: Color(0xffA4ACAD))),
                Text("70 د.ل",
                    style: AppTextStyles.text16.copyWith(fontSize: 14),
                    textDirection: TextDirection.rtl)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
