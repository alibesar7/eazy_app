
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_postioned_widget.dart';
import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class UpgradeViewBody extends StatelessWidget {
  const UpgradeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColors.sub),
        CustomPostionedWidget(
          asset: Assets.assetsIconsRectangle1,
          right: 0,
          top: 0,
        ),
        CustomPostionedWidget(
          asset: Assets.assetsIconsRectangle2,
          right: 0,
          top: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.6.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: 35.h,
                  child: Stack(
                    children: [
                      CustomPostionedWidget(
                        asset: Assets.assetsIconsBack,
                        right: -5,
                        top: 60,
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 65),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(Assets.assetsIconsUnlocked),
                              SizedBox(height: 4.h),
                              Text("الترقية إلي\nالنسخة المميزة",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.titleText),
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
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(18),
                  border:
                      Border(top: BorderSide(color: AppColors.s, width: 15)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.5.h,
                    ),
                    Text("اشتراك اسبوعي",
                        style: AppTextStyles.text16
                            .copyWith(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.h, vertical: 3.h),
                      child: Text(
                        " وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر",
                        style: AppTextStyles.text16
                            .copyWith(color: Color(0xffA4ACAD), height: 2.5),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("وصف الميزة هنا",
                            style: AppTextStyles.text16.copyWith(
                                fontSize: 14, fontWeight: FontWeight.normal)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: Image.asset(Assets.assetsIconsVector),
                        )
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("وصف الميزة هنا",
                            style:
                                AppTextStyles.text16.copyWith(fontSize: 14)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: Image.asset(Assets.assetsIconsVector),
                        )
                      ],
                    ),
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
                            style: AppTextStyles.text16.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 17, left: 17, bottom: 30),
                      child: SizedBox(
                        height: 6.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xfffaf1dc),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center, // ⬅️ مهم
    
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("  اشتراك   ",
                                    style: AppTextStyles.text16
                                        .copyWith(color: AppColors.s)),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Image.asset(Assets.assetsIconsGroup),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
