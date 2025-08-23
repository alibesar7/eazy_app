
import 'package:flutter/material.dart';

import '../../../../utils/appColors.dart';
import '../../../../utils/appStyles.dart';

class bottomWidget extends StatelessWidget {
  const bottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("00:55",
            style: AppTextStyles.text14
                .copyWith(color: AppColors.primary)),
        Text(
          "  حاول مرة أخرى بعد",
          style:
              AppTextStyles.text14.copyWith(color: const Color(0xffA4ACAD)),
        )
      ],
    ));
  }
}