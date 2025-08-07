import 'package:esay_app/utils/appAssets.dart';
import 'package:flutter/material.dart';

import '../../../utils/appColors.dart';
import '../../../utils/appStyles.dart';
import 'custom_postioned_widget.dart';

class UpgradeViewBody extends StatelessWidget {
  const UpgradeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Stack(
      children: [
        Container(color: AppColors.sub),
        CustomPostionedWidget(
          asset: AppAssets.assetsIconsRectangle1,
          right: 0,
          top: 0,
        ),
        CustomPostionedWidget(
          asset: AppAssets.assetsIconsRectangle2,
          right: 0,
          top: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.35,
                  child: Stack(
                    children: [
                      CustomPostionedWidget(
                        asset: AppAssets.assetsIconsBack,
                        right: -5,
                        top: 60,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 65),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(AppAssets.assetsIconsUnlocked),
                              SizedBox(height: screenHeight * 0.04),
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
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(18),
                    border: Border(
                      top: BorderSide(color: AppColors.s, width: 15),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.035),
                      Text(
                        "اشتراك اسبوعي",
                        style: AppTextStyles.text16.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.03,
                        ),
                        child: Text(
                          " وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر",
                          style: AppTextStyles.text16.copyWith(
                            color: Color(0xffA4ACAD),
                            height: 2.5,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "وصف الميزة هنا",
                            style: AppTextStyles.text16.copyWith(fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                            child: Image.asset(AppAssets.assetsIconsVector),
                          )
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "وصف الميزة هنا",
                            style: AppTextStyles.text16.copyWith(fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                            child: Image.asset(AppAssets.assetsIconsVector),
                          )
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.06),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                            child: Text(
                              "70 د.ل",
                              style: AppTextStyles.text16.copyWith(
                                fontSize: 14,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red,
                              ),
                            ),
                          ),
                          Text(
                            "70 د.ل",
                            style: AppTextStyles.text16.copyWith(fontSize: 14),
                          ),
                          const Spacer(flex: 2),
                          Text(
                            "السعر     ",
                            style: AppTextStyles.text16.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Padding(
                        padding: const EdgeInsets.only(right: 17, left: 17, bottom: 30),
                        child: SizedBox(
                          height: screenHeight * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffaf1dc),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "  اشتراك   ",
                                  style: AppTextStyles.text16.copyWith(color: AppColors.s),
                                ),
                                const SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Image.asset(AppAssets.assetsIconsGroup),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
