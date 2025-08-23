import 'package:esay_app/Features/SubscriptionsScreens/Presentation/views/widgets/custom_postioned_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/appAssets.dart';
import '../../../../../utils/appStyles.dart';

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
            asset: AppAssets.assetsIconsBack,
            right: -5,
            top: 60,
            onPressed: () {
              Navigator.of(context).maybePop();
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
                  SizedBox(height: 4.h),
                  const Text("الترقية إلي\nالنسخة المميزة",
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
