import 'package:esay_app/Features/Custom_Widgets/Custom_Button.dart';
import 'package:esay_app/Features/LessonsScreen/CustomListTile.dart';
import 'package:esay_app/utils/appAssets.dart';
import 'package:esay_app/utils/appColors.dart';
import 'package:esay_app/utils/appStyles.dart';
import 'package:flutter/material.dart';

class Lessonscreens extends StatefulWidget {
  const Lessonscreens({super.key});
  static const String routeScreen = "LessonScreen";

  @override
  State<Lessonscreens> createState() => _LessonscreenState();
}

class _LessonscreenState extends State<Lessonscreens> {
  bool sub=false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppAssets.arrowIcon,
            height: h * 0.015,
            width: w * 0.015,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.02),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: h * 0.28,
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.grammer,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: h * 0.21,
                      right: w * 0.14,
                      child: SizedBox(
                        width: w * 0.7,
                        height: h * 0.06,
                        child: CustomElevatedButton(
                          onButtonClick: () {},
                          text: "ابدأ الدرس الاول",
                          textStyle: AppTextStyles.text16.copyWith(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topRight,
                child: Text("القواعد", style: AppTextStyles.text16),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("الوصف", style:AppTextStyles.text16),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "يوضع هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر كهذا المثال. يوضع هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر. يوضع هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر ... المزيد ",
                  style:AppTextStyles.text16.copyWith(
                    color: Color(0xffA4ACAD),
                    height: 2.5,
                    fontSize: 15,
                  ), maxLines: 4,
                ),
              ),

              SizedBox(height: h * .02),
              Divider(
                color: Colors.grey,
                endIndent: 30,
                indent: 30,
              ),
              Text("الدروس", style: AppTextStyles.text16),
              SizedBox(height: h * 0.01),
              Customlisttile(lock: true),
              Customlisttile(lock: false),
            ],
          ),
        ),
      ),
    );
  }
}
