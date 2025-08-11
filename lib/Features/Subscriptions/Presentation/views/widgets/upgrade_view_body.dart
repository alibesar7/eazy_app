import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_postioned_widget.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_row.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_sub_card.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/upgrade_top_section.dart';
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
                    text: "  اشتراك   ",
                    image: Image.asset(Assets.assetsIconsGroup),
                    textStyle:
                        AppTextStyles.text16.copyWith(color: AppColors.s),
                    padding: const EdgeInsets.only(bottom: 8),
                    mainAxisAlignmen: MainAxisAlignment.center,
                  ),
                ),
                backColor: AppColors.background,
                borderColor: AppColors.s,
                btnColor: Color(0xfffaf2dd),
              ))
            ],
          ),
        )
      ],
    );
  }
}
