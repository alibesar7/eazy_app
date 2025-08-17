
import 'package:flutter/material.dart';

import '../../../../utils/appAssets.dart';
import '../../../../utils/appStyles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.tilte,
    required this.leading, required this.onTap,
  });

  final String tilte;
  final Widget leading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(      color: Colors.transparent, // لو مش عايز خلفية

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InkWell(onTap:onTap ,
          child: ListTile(
            leading: leading,
            title: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                tilte,
                style: AppTextStyles.tileTiltle,
              ),
            ),
            trailing: Image.asset(
              AppAssets.assetsIconsArrowLeft,
            ),
          ),
        ),
      ),
    );
  }
}
