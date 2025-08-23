import 'dart:ui';

import 'package:esay_app/Features/QiuzScreen/quizModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/appAssets.dart';
import '../../utils/appColors.dart';
import '../../utils/appStyles.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<int?> userAnswers;
  final VoidCallback onShowSolutions;

  const ResultScreen({super.key, 
    required this.questions,
    required this.userAnswers,
    required this.onShowSolutions,
  });

  int get correctAnswers {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswerIndex) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    double padding = screenW * 0.05;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          SizedBox(height: screenH * 0.03),
          Align(
            alignment: Alignment.centerRight,
            child:  Padding(
          padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AppAssets.arrowIcon,
        height: screenH * 0.015,
        width: screenW* 0.015,
      ),
    ),
          ),
          Image.asset(AppAssets.succes, height: screenH * 0.25),
          SizedBox(height: screenH * 0.05),
          Text("نتيجة الاختبار",
              style: AppTextStyles.headerofLesson
                  .copyWith(fontSize: screenW * 0.045)),
          SizedBox(height: screenH * 0.04),
          Container(
            width: double.infinity,
            height: screenH * 0.3,
            decoration: BoxDecoration(
              color: const Color(0xff2a72ad1f),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(
                vertical: screenH * 0.03, horizontal: screenW * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "$correctAnswers",
                        style: const TextStyle(color: AppColors.primary),
                      ),
                      const TextSpan(
                        text: "/",
                        style: TextStyle(color: AppColors.primary),
                      ),
                      WidgetSpan(
                        child: Text(
                          "${questions.length}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 23),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenH * 0.035),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: List.generate(userAnswers.length, (index) {
                    final isCorrect = userAnswers[index] ==
                        questions[index].correctAnswerIndex;
                    return CircleAvatar(
                      radius: screenW * 0.06,
                      backgroundColor:
                      isCorrect ? AppColors.primary : AppColors.red,
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenW * 0.045,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: screenH * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("${questions.length} أسئلة",
                            style: AppTextStyles.black14),
                        Text("5 دقائق",
                            style: AppTextStyles.black14
                                .copyWith(color: Colors.grey)),
                      ],
                    ),
                    GestureDetector(
                      onTap: onShowSolutions,
                      child: Row(
                        children: [
                          Text("عرض الحلول",
                              style: AppTextStyles.blue14
                                  .copyWith(color: AppColors.orange)),
                          SizedBox(width: screenW * 0.01),
                          Image.asset(AppAssets.eye, width: screenW * 0.08),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: screenH * 0.07,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {

              },
              child: Text("انتقل للدرس التالي",
                  style: AppTextStyles.titleText.copyWith(
                      fontSize: screenW * 0.035, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}