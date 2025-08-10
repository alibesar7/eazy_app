
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_postioned_widget.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class UpgradeTopSection extends StatelessWidget {
  const UpgradeTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
