
import 'package:flutter/material.dart';

import '../../../../utils/appColors.dart';
import '../../../../utils/appStyles.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 393,
      child: Column(
        children: [
          SizedBox(
            height: 41,
          ),
          Text(
            "حذف الحساب",
            style:
                AppTextStyles.text16.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 23),
          Text(
            "هل انت متأكد من انك تريد حذف الحساب؟ سيتم حذف البيانات بشكل كامل",
            style: AppTextStyles.text14
                .copyWith(color: Color(0xffA4ACAD)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 57,
                    width: 165,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffAFB6B7),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "تراجع",
                        style: AppTextStyles.text14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 57,
                    width: 165,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("نعم",
                            style: AppTextStyles.text14)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
