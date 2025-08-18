import 'package:esay_app/utils/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/appStyles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyles.text16.copyWith(fontSize: 18),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(.1),
          ),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: Image.asset(AppAssets.assetsIconsLeft),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
