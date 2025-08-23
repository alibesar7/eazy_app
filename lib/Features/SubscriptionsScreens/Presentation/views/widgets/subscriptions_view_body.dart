
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/appStyles.dart';
import 'custom_sub_card.dart';

class SubcriptionsViewBody extends StatelessWidget {
  const SubcriptionsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: SizedBox(
            height: 65.h,
            child: CustomSubCard(
              onPressed: ()=> context.push("/payment"),
              btnColor: const Color(0xffE5E5E5),
              title: Text("تجديد الاشتراك",
                  style: AppTextStyles.text16.copyWith(
                      fontWeight: FontWeight.bold, color: const Color(0xffA4ACAD))),
              row: Padding(
                padding: EdgeInsets.only(top: 2.h, right: .5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      " يناير 2023",
                      style: AppTextStyles.text16.copyWith(
                          fontSize: 12, color: Colors.grey.shade500),
                    ),
                    Text(
                      "  تاريخ التجديد    ",
                      style: AppTextStyles.text16.copyWith(
                          fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              backColor: Colors.grey.withOpacity(.1),
              borderColor: const Color(0xff2A72AD),
            ),
          ),
        )
      ],
    );
  }
}
