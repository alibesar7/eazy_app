import 'package:esay_app/Features/LessonsScreen/LessonDetails/LessonsDetails.dart';
import 'package:esay_app/Features/LessonsScreen/UpgradeScreen/Upgrade_view.dart';
import 'package:esay_app/Features/QiuzScreen/QuizView.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../utils/appAssets.dart';
import '../../utils/appColors.dart';
import '../../utils/appStyles.dart';

class Customlisttile extends StatefulWidget {
   Customlisttile({super.key, required this.lock});
  final bool lock;

  @override
  State<Customlisttile> createState() => _CustomlisttileState();
}

class _CustomlisttileState extends State<Customlisttile> {


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    bool sub= false;
    return Padding(
      padding: EdgeInsets.only(bottom: h * .02),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundListtile,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: InkWell(
            onTap: (){
              Navigator.pushNamed(context, Lessonsdetails.routeScreen);
              },
            child: Text(
              "الدرس الأول",
              style:   AppTextStyles.caption.copyWith(color: Colors.grey)),
          ),
          subtitle: Text(
            "الفرق بين {a-an}",
            style:  AppTextStyles.text16,
          ),
          trailing: widget.lock
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                 sub== false? InkWell(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>UpgradeView()));
                  },
                  child: Container(
                    width:w*.21,
                    height: h*0.03,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("اشترك",style: AppTextStyles.buttonText.copyWith(fontWeight: FontWeight.bold),),
                        Image.asset(AppAssets.whitelock,
                          height: h*0.05,
                          width: w*0.05,),
                      ],
                    ),
                  ),
                ): InkWell(
                   onTap: (){},
                  child: Image.asset(
                    AppAssets.lock,
                    width: w * 0.06,
                    height: h * 0.035,
                  ),
                ),

              SizedBox(width: w * 0.02),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, QuizScreen.routeScreen);
                },
                child: Image.asset(
                  AppAssets.saveWhiteicon,
                  width: w * 0.1,
                  height: h * 0.09,
                ),
              ),
            ],
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        contentPadding: const EdgeInsets.all(16),

                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: w*.6),
                              child: GestureDetector(
                                  onTap:(){
                                    Navigator.pop(context);
                                  },child: Image.asset(AppAssets.assetsIconsBack)),
                            ),
                            Image.asset(
                              AppAssets.errorDilog,
                              height: h*.15,
                              width: w*.15,
                            ),
                            SizedBox(height: h*.01,),
                            const Text(
                              "من فضلك استكمل الدرس السابق\nلتتمكن من فتح هذا الدرس",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.AlertText,
                            ),
                            SizedBox(height: h*.03,),
                          ],
                        ),
                      );
                    },
                  );

                },

                child: Image.asset(
                  AppAssets.saveicon,
                  width: w * 0.06,
                  height: h * 0.035,
                ),
              ),
              SizedBox(width: w * 0.02),
            ],
          ),


        ),
      ),
    );
  }
}
