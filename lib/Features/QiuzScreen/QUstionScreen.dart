
import 'package:esay_app/Features/QiuzScreen/quizModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/appColors.dart';
import '../../utils/appStyles.dart';

class QuestionPage extends StatelessWidget {
  final Question question;
  final int questionIndex;
  final int totalQuestions;
  final int? selectedAnswer;
  final Function(int) onAnswerSelected;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  final List<int> visiblePageNumbers;
  final int currentQuestion;

  const QuestionPage({
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.onNextPressed,
    required this.onPreviousPressed,
    required this.visiblePageNumbers,
    required this.currentQuestion,
  });

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    double padding = screenW * 0.05;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenH * 0.05),
          Text("اختبار سريع",
              style: TextStyle(
                  fontSize: screenW * 0.06, fontWeight: FontWeight.bold)),
          SizedBox(height: screenH * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon: const Icon(Icons.arrow_back_ios),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: currentQuestion < totalQuestions - 1 ? onNextPressed : null,
              ),

              ...visiblePageNumbers.map((pageIndex) {
                final isActive = pageIndex == currentQuestion;
                return GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: screenW * 0.08,
                    height: screenW * 0.08,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${pageIndex + 1}",
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: screenW * 0.04,
                      ),
                    ),
                  ),
                );
              }).toList(),
             // icon: const Icon(Icons.arrow_forward_ios),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: currentQuestion > 0 ? onPreviousPressed : null,
              ),
            ],
          ),
          SizedBox(height: screenH * 0.015),
          Text("أنهيت ${questionIndex + 1} من $totalQuestions",
              style: AppTextStyles.graynumberq),
          SizedBox(height: screenH * 0.04),
          Row(
            children: [
              Image.asset("assets/images/Group.png", height: screenH * 0.025),
              SizedBox(width: screenW * 0.02),
              Text("اختيار متعدد", style: AppTextStyles.blue14),
            ],
          ),
          SizedBox(height: screenH * 0.015),
          Text(question.questionText,
              style: AppTextStyles.question,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl),
          SizedBox(height: screenH * 0.03),
          ...List.generate(question.options.length, (i) {
            final isSelected = selectedAnswer == i;

            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenH * 0.01),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? AppColors.primary : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: Size(double.infinity, screenH * 0.07),
                ),
                onPressed: () => onAnswerSelected(i),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    question.options[i],
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'FFShamelFamily',
                      fontSize: screenW * 0.035,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
          const Spacer(),
          SizedBox(
            height: screenH * 0.07,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                backgroundColor: AppColors.primary,
              ),
              onPressed: selectedAnswer == null ? null : onNextPressed,
              child: Text("التالي",
                  style: AppTextStyles.titleText.copyWith(
                      fontSize: screenW * 0.035, color: Colors.white)),
            ),
          ),
          SizedBox(height: screenH * 0.05),
        ],
      ),
    );
  }
}