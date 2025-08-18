
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/appAssets.dart';
import '../../../../../utils/appStyles.dart';
import 'custom_row.dart';

class CustomSubCard extends StatelessWidget {
  const CustomSubCard({
    super.key,
    required this.backColor,
    required this.borderColor,
    this.renewDate,
    this.date,
    this.row,
    required this.title,
    required this.btnColor, this.onPressed,
  });
  final Color backColor;
  final Color borderColor;
  final String? renewDate;
  final String? date;
  final Widget? row;
  final Widget title;
  final Color btnColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: .8.h),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(18),
        border: Border(top: BorderSide(color: borderColor, width: 15)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 3.5.h,
          ),
          Text("اشتراك اسبوعي",
              style:
                  AppTextStyles.text16.copyWith(fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 3.h),
            child: Text(
              " وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر",
              style: AppTextStyles.text16
                  .copyWith(color: Color(0xffA4ACAD), height: 2.5),
              textAlign: TextAlign.right,
            ),
          ),
          CustomRow(
              text: "وصف الميزة هنا",
              mainAxisAlignmen: MainAxisAlignment.end,
              textStyle: AppTextStyles.text16
                  .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
              image: Image.asset(AppAssets.assetsIconsVector)),
          SizedBox(height: 3.h),
          CustomRow(
              text: "وصف الميزة هنا",
              textStyle: AppTextStyles.text16
                  .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
              mainAxisAlignmen: MainAxisAlignment.end,
              image: Image.asset(AppAssets.assetsIconsVector)),
          SizedBox(child: row),
          SizedBox(height: 6.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Text(
                  "70 د.ل",
                  style: AppTextStyles.text16.copyWith(
                      fontSize: 14,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red),
                ),
              ),
              Text(
                "70 د.ل",
                style: AppTextStyles.text16.copyWith(
                  fontSize: 14,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Text("السعر     ",
                  style: AppTextStyles.text16
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 17, left: 17, bottom: 30),
            child: SizedBox(
              height: 6.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: onPressed,
                child: Center(
                  child: title,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
