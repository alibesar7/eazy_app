

import 'package:flutter/material.dart';

import '../../../../utils/appAssets.dart';
import '../../../../utils/appColors.dart';
import '../../../../utils/appStyles.dart';

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
        image: Image.asset(AppAssets.assetsIconsGroup),
        textStyle:
            AppTextStyles.text16.copyWith(color: AppColors.s),
        padding: const EdgeInsets.only(bottom: 8),
        mainAxisAlignmen: MainAxisAlignment.center,
      ),
    );
  }
}
