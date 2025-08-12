import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_list_tile.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_row.dart';
import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
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
  }

  Widget _buildNavItem({
    required IconData icon,
    required String text,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;
    final Color color = isSelected ? Colors.blue : Colors.black;

    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(text, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
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
              Container(
                height: 110,
                width: 355,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "محمد عمران",
                            style: AppTextStyles.text14.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: .5.h),
                          Row(
                            children: [
                              Text("  تعديل حسابي  ", style: AppTextStyles.smallText),
                              Image.asset(Assets.assetsIconsWrite),
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 2.h),
                      SizedBox(
                        height: 120,
                        width: 80,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            Assets.assetsIconsOval,
                            height: 81,
                            width: 81,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 54,
                width: 355,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffaf2dd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: CustomRow(
                    text: " الترقية إلى النسخة المميزة   ",
                    image: Image.asset(Assets.assetsIconsGroup),
                    textStyle: AppTextStyles.text16.copyWith(color: AppColors.s),
                    padding: const EdgeInsets.only(bottom: 8),
                    mainAxisAlignmen: MainAxisAlignment.center,
                  ),
                ),
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
                    style: AppTextStyles.text14.copyWith(color: Colors.grey.withOpacity(.5)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onItemTapped(0),
        backgroundColor: Colors.black,
        elevation: 2.0,
        child: Icon(
          Icons.home,
          color: selectedIndex == 0 ? Colors.blueAccent : Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(
              icon: Icons.person,
              text: 'حسابي',
              index: 1,
            ),
            const SizedBox(width: 48),
            _buildNavItem(
              icon: Icons.book,
              text: 'دروسي',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }
}
