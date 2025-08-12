
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAccountCard extends StatelessWidget {
  const CustomAccountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 355,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Colors.grey.withOpacity(.1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "محمد عمران",
                  style: AppTextStyles.text14
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: .5.h),
                Row(
                  children: [
                    Text("  تعديل حسابي  ",
                        style: AppTextStyles.smallText),
                    Image.asset(Assets.assetsIconsWrite),
                  ],
                )
              ],
            ),
            SizedBox(width: 2.h),
            SizedBox(
              height: 120,
              width: 80,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Image.asset(
                  Assets.assetsIconsOval,
                  height: 81,
                  width: 81,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
