import 'package:esay_app/Features/SubscriptionsScreens/Presentation/views/widgets/custom_postioned_widget.dart';
import 'package:esay_app/Features/SubscriptionsScreens/Presentation/views/widgets/upgrade_top_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/appAssets.dart';
import '../../../../../utils/appColors.dart';
import '../../../../../utils/appStyles.dart';
import 'custom_row.dart';
import 'custom_sub_card.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 1.6.h),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: UpgradeTopSection(),
              ),
              SliverToBoxAdapter(
                  child: CustomSubCard(
                onPressed: () {},
                title: InkWell(
                  onTap: () {
                    context.push("/subscriptions");
                  },
                  child: CustomRow(
                    image: Image.asset(AppAssets.assetsIconsGroup),
                    text: "  اشتراك   ",
                    textStyle:
                        AppTextStyles.text16.copyWith(color: AppColors.s),
                    padding: const EdgeInsets.only(bottom: 8),
                    mainAxisAlignmen: MainAxisAlignment.center,
                  ),
                ),
                backColor: AppColors.background,
                borderColor: AppColors.s,
                btnColor: const Color(0xfffaf2dd),
              ))
            ],
          ),
        )
      ],
    );
  }
}
