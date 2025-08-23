import 'package:esay_app/Features/QiuzScreen/quizModel.dart';
import 'package:esay_app/utils/appAssets.dart';
import 'package:esay_app/utils/appColors.dart';
import 'package:esay_app/utils/appStyles.dart';
import 'package:flutter/material.dart';

import 'QUstionScreen.dart';
import 'RuseltScreen.dart';

class QuizScreen extends StatefulWidget {
  static const String routeScreen = "QuizScreen";

  const QuizScreen({super.key});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _pageController = PageController();
  final List<Question> _questions = [
    Question(
      questionText: "ما هي عاصمة المملكة العربية السعودية؟",
      options: ["الرياض", "جدة", "مكة", "الدمام"],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "كم عدد الكواكب في المجموعة الشمسية؟",
      options: ["7", "8", "9", "10"],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "ما هو أكبر محيط في العالم؟",
      options: [
        "المحيط الأطلسي",
        "المحيط الهادي",
        "المحيط الهندي",
        "المحيط المتجمد الشمالي"
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "من هو مخترع المصباح الكهربائي؟",
      options: [
        "توماس إديسون",
        "ألبرت أينشتاين",
        "إسحاق نيوتن",
        "نيكولا تسلا"
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "كم عدد ألوان قوس قزح؟",
      options: ["6", "7", "8", "9"],
      correctAnswerIndex: 1,
    ),
  ];
  int _currentQuestion = 0;
  int _score = 0;
  late List<int?> _userAnswers;

  @override
  void initState() {
    super.initState();
    _userAnswers = List<int?>.filled(_questions.length, null);
  }

  void _selectAnswer(int selectedIndex) {
    setState(() {
      _userAnswers[_currentQuestion] = selectedIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _calculateScore();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousQuestion() {
    if (_currentQuestion > 0) {
      setState(() {
        _currentQuestion--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _calculateScore() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] == _questions[i].correctAnswerIndex) {
        correctAnswers++;
      }
    }
    setState(() {
      _score = correctAnswers;
    });
  }

  List<int> _getVisiblePageNumbers() {
    const maxVisible = 4;
    List<int> reversedIndexes =
    List.generate(_questions.length, (i) => i).reversed.toList();
    int currentPos = reversedIndexes.indexOf(_currentQuestion);
    int start = (currentPos - (maxVisible ~/ 2))
        .clamp(0, _questions.length - maxVisible);
    int end = (start + maxVisible).clamp(0, _questions.length);
    return reversedIndexes.sublist(start, end);
  }

  void _showSolutions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset(
                  AppAssets.arrowIcon,
                  height: MediaQuery.of(context).size.height* 0.015,
                  width: MediaQuery.of(context).size.width* 0.015,
                ),
              ),
            ),
            title: Text("النتائج",style: AppTextStyles.titleText
                  .copyWith(fontSize: 20,color: Colors.black),),
            centerTitle: true,
          ),
          body: _buildAnswersReview(),
        ),
      ),
    );
  }

  Widget _buildAnswersReview() {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    double padding = screenW * 0.05;

    return ListView.builder(
      padding: EdgeInsets.all(padding),
      itemCount: _questions.length,
      itemBuilder: (context, index) {
        final question = _questions[index];
        final correctAnswer = question.correctAnswerIndex;
        final userAnswer = _userAnswers[index];

        return Padding(
          padding: EdgeInsets.only(bottom: screenH * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/Group.png", height: screenH * 0.025),
                  SizedBox(width: screenW * 0.02),
                  const Text("اختيار متعدد", style: AppTextStyles.blue14),
                ],
              ),
              SizedBox(height: screenH*0.02,),
              Text(
                question.questionText,
                style: TextStyle(
                  fontFamily: 'FFShamelFamily',
                  fontSize: screenW * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: screenH * 0.02),
              ...question.options.map((option) {
                bool isCorrect = question.options.indexOf(option) == correctAnswer;
                bool isUserChoice = question.options.indexOf(option) == userAnswer;

                return Container(
                  height: screenH*0.08,
                  margin: EdgeInsets.only(bottom: screenH * 0.015),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? AppColors.primary
                        : (isUserChoice && !isCorrect ? AppColors.red : Colors.white),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isCorrect || (isUserChoice && !isCorrect)
                          ? Colors.transparent
                          : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenW * 0.04,
                      vertical: screenH * 0.01,
                    ),
                    title: Text(
                      option,
                      style: TextStyle(
                        fontFamily: 'FFShamelFamily',
                        fontSize: screenW * 0.035,
                        color: isCorrect || (isUserChoice && !isCorrect)
                            ? Colors.white
                            : Colors.black,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _questions.length + 1,
        itemBuilder: (context, index) {
          if (index == _questions.length) {
            return ResultScreen(
              questions: _questions,
              userAnswers: _userAnswers,
              onShowSolutions: () => _showSolutions(context),
            );
          } else {
            return QuestionPage(
              question: _questions[index],
              questionIndex: index,
              totalQuestions: _questions.length,
              selectedAnswer: _userAnswers[index],
              onAnswerSelected: _selectAnswer,
              onNextPressed: _nextQuestion,
              onPreviousPressed: _previousQuestion,
              visiblePageNumbers: _getVisiblePageNumbers(),
              currentQuestion: _currentQuestion,
            );
          }
        },
      ),
    );
  }
}

