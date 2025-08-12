import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_account_card.dart';
import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_list_tile.dart';
import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_nav_bar.dart';
import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_upgrade_account_btn.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_row.dart';
import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

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
                  Image.asset(Assets.assetsIconsSurface),
                  Image.asset(Assets.assetsIconsEazy2),
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
                onTap: () {},
                tilte: "الاشتراكات",
                leading: Image.asset(Assets.assetsIconsSubscriptions),
              ),
              CustomListTile(
                onTap: () {},
                tilte: "الأسئلة الشائعة",
                leading: Image.asset(Assets.assetsIconsQuestions),
              ),
              CustomListTile(
                onTap: () {},
                tilte: "الشروط والأحكام",
                leading: Image.asset(Assets.assetsIconsConditions),
              ),
              CustomListTile(
                onTap: () {},
                tilte: "تواصل معانا",
                leading: Image.asset(Assets.assetsIconsCalls),
              ),
              CustomListTile(
                onTap: () {},
                tilte: "مشاركة التطبيق",
                leading: Image.asset(Assets.assetsIconsShares),
              ),
              SizedBox(height: 1.h),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "تسجيل الخروج",
                    style: AppTextStyles.text14
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
          Assets.assetsIconsHome,
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
              image: Assets.assetsIconsPerson,
              text: 'حسابي',
              index: 1,
              selectedIndex: selectedIndex,
              onItemTapped: onItemTapped,
            ),
            const SizedBox(width: 48),
            CustomNavItem(
              selectedIndex: selectedIndex,
              image: Assets.assetsIconsBook,
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
