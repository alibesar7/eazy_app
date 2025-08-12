import 'package:flutter/material.dart';
import '../../../utils/appAssets.dart';
import '../../../utils/appStyles.dart';
import 'custom_postioned_widget.dart';

class UpgradeTopScetion extends StatelessWidget {
  const UpgradeTopScetion({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.35, // تعني 35% من ارتفاع الشاشة
      child: Stack(
        children: [
          CustomPostionedWidget(
            asset: AppAssets.assetsIconsBack,
            right: -5,
            top: screenHeight * 0.065, // تقريباً 60-70 من ارتفاع الشاشة
            onPressed: () {
              Navigator.pop(context); // context.pop() قد لا تعمل خارج بعض المكتبات
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.08),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.assetsIconsUnlocked,
                    height: screenHeight * 0.08,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    "الترقية إلي\nالنسخة المميزة",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
