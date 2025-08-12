import 'package:esay_app/Features/LessonsScreen/LessonDetails/LessonsDetails.dart';
import 'package:esay_app/Features/LessonsScreen/lessonScreen.dart';
import 'package:esay_app/Features/QiuzScreen/QuizView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const EazyApp());
}

class EazyApp extends StatelessWidget {
  const EazyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      initialRoute: Lessonscreen.routeScreen,
      routes: {
        QuizScreen.routeScreen:(context)=>QuizScreen(),
        Lessonsdetails.routeScreen:(context)=>Lessonsdetails(),
        Lessonscreen.routeScreen: (context) => Lessonscreen(),
      },
    );
  }
}
