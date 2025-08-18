

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/appAssets.dart';
import '../../../../utils/appAssets.dart';
import '../../../../utils/appStyles.dart';
import '../../../LessonsScreen/UpgradeScreen/Upgrade_view.dart';
import '../../../Other/common_questions.dart';
import '../../../Other/contact_us.dart';
import '../../../Other/log_out_q.dart';
import '../../../Other/share_app..dart';
import '../../../Other/terms_and_condition.dart';
import '../../../SubscriptionsScreens/Presentation/views/Subscriptions_view.dart';
import '../widgets/custom_account_card.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/custom_upgrade_account_btn.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // switch (index) {
    //   case 0:
    //    context.push('/'); // متنساش تحط الصفحة هنا
    //     break;
    //   case 1:
    //    context.push('/'); // متنساش تحط الصفحة هنا
    //     break;
    //   case 2:
    //    context.push('/');
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "حسابى",
                style: AppTextStyles.text16.copyWith(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.assetsIconsSurface),
                  Image.asset(AppAssets.assetsIconsEazy2),
                ],
              ),
              SizedBox(height: 4.h),
              CustomAccountCard(),
              SizedBox(height: 2.h),
              SizedBox(
                height: 54,
                width: 355,
                child: CustomUpgradeAccountBtn(),
              ),
              SizedBox(height: 2.h),
              CustomListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpgradeView()));

                },
                tilte: "الاشتراكات",
                leading: Image.asset(AppAssets.assetsIconsSubscriptions),
              ),
              CustomListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CommonQuestions()));

                },
                tilte: "الأسئلة الشائعة",
                leading: Image.asset(AppAssets.assetsIconsQuestions),
              ),
              CustomListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndCondition()));
                },
                tilte: "الشروط والأحكام",
                leading: Image.asset(AppAssets.assetsIconsConditions),
              ),
              CustomListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));

                },
                tilte: "تواصل معانا",
                leading: Image.asset(AppAssets.assetsIconsCalls),
              ),
              CustomListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShareApp()));

                },
                tilte: "مشاركة التطبيق",
                leading: Image.asset(AppAssets.assetsIconsShares),
              ),
              SizedBox(height: 1.h),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOut()));

                  },
                  child: Text(
                    "تسجيل الخروج",
                    style: AppTextStyles.text16
                        .copyWith(color: Colors.grey.withOpacity(.5)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onItemTapped(0),
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        elevation: 2.0,
        child: Image.asset(
          AppAssets.assetsIconsHome,
          color: selectedIndex == 0 ? Colors.blueAccent : Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomNavItem(
              image: AppAssets.assetsIconsPerson,
              text: 'حسابي',
              index: 1,
              selectedIndex: selectedIndex,
              onItemTapped: onItemTapped,
            ),
            const SizedBox(width: 48),
            CustomNavItem(
              selectedIndex: selectedIndex,
              image: AppAssets.assetsIconsBook,
              onItemTapped: onItemTapped,
              text: 'دروسي',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }
}
