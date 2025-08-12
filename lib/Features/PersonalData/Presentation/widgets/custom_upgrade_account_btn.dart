

import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_row.dart';
import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CustomUpgradeAccountBtn extends StatelessWidget {
  const CustomUpgradeAccountBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xfffaf2dd),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: CustomRow(
        text: " الترقية إلى النسخة المميزة   ",
        image: Image.asset(Assets.assetsIconsGroup),
        textStyle:
            AppTextStyles.text16.copyWith(color: AppColors.s),
        padding: const EdgeInsets.only(bottom: 8),
        mainAxisAlignmen: MainAxisAlignment.center,
      ),
    );
  }
}
