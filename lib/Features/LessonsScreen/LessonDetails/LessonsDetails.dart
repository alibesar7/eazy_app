import 'package:esay_app/utils/appColors.dart';
import 'package:esay_app/utils/appStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/appAssets.dart';

class Lessonsdetails extends StatelessWidget {
  const Lessonsdetails({super.key});
   static const String routeScreen="Lessons details";
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset(
                AppAssets.arrowIcon,
                height: h * 0.015,
                width: w * 0.015,
              ),
            ),
          ),
        ),
      body: Padding(
        padding:  EdgeInsets.all(w*.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.grammer,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("الفرق بين{a-an}",style: AppTextStyles.headerofLesson,),
                  Image.asset(
                    AppAssets.saveWhiteicon,
                    width: w * 0.1,
                    height: h * 0.09,
                  ),
                ],
              ),
              Text("وصف الدرس",style: AppTextStyles.secondheaderofLesson,),
              Text("يوضع هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر كهذا المثال. يوضع هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر. يوضع هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر . ",style: AppTextStyles.descrptionofLesson,),
             SizedBox(height: h*.015,),
              Text("شرح الفرق بين a و an و the بالتفصيل",style: AppTextStyles.blue14,),
              Text(
                '''
قبل الشرح لازم نعرف حروف العلة او الحروف المتحركة
وهي (A-E-I-O-U)

تأتي قبل الاسماء المفردة المعدودة..وقبل الوظيفة أو
مجموعة معينة من الناس أو الجنسية..

a day مع الأرقام التي تعني "كل" مثل

ولا نستخدم an - a مع الاسماء المعنوية و اسماء
المعادن وقبل الجمع أو الاسماء الغير معدودة

(A-E-I-O-U) اذا الكلمة التي تبدأ بحرف علة اي هي
نستخدم an واذا الكلمة لا تبدأ بأحد حروف العلة نستخدم a

نستخدم a قبل الاسم مفرد معدود يبدأ بحرف ساكن
''',
                style:  AppTextStyles.black14,
                textAlign: TextAlign.right,
              ),
              RichText(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                text: TextSpan(
                  style: AppTextStyles.black14,
                  children: [
                    TextSpan(text: 'أمثلة :\n', style: AppTextStyles.orange14),
                    TextSpan(text: '''
• إنها هدية : It's a present.
• إنه يوم جميل : It's a lovely day.
• هل أنت طبيب؟ : Are you a doctor?
• أنا عندي بنت وولدين. : I have got a daughter and two sons

'''),
                    TextSpan(text: 'انتبـه! ', style: TextStyle(color: Colors.red, fontFamily: 'Shamel', fontSize: 16)),
                    TextSpan(text: '''لا تستخدم a قبل الاسم الجمع وكذلك قبل
الأسماء الغير معدودة.
نستخدم an قبل اسم مفرد معدود يبدأ بحرف متحرك.'''),
                  ],
                ),
              ),
              SizedBox(height: h*0.02,),
              SizedBox(
                height: h * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.all(h*.02),
                          child: SizedBox(
                            height: h * 0.23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 12),
                                Text(
                                  "الخروج من الدرس",
                                  style: AppTextStyles.headerofLesson,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "هل تود الخروج من الدرس؟ يمكنك الرجوع في أي وقت",
                                  style:AppTextStyles.descrptionofLesson,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: h*0.03,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            foregroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: Text("نعم",style: AppTextStyles.titleText.copyWith(fontSize: 14),),
                                        ),
                                        height: h*0.07,
                                      ),
                                    ),
                                    SizedBox(width: w*0.06,),
                                    Expanded(
                                      child: Container(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:Color(0xffAFB6B7),
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("تراجع",style: AppTextStyles.titleText.copyWith(fontSize: 14)),
                                        ),
                                        height: h*0.07,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'انهي الدرس',
                    style: AppTextStyles.text16.copyWith(color: Colors.white),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    )  ;
  }
}
