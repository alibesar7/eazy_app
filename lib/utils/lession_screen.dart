// lesson_screen.dart
import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  final String lessonTitle;

  const LessonScreen({super.key, required this.lessonTitle});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lessonTitle),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'محتويات درس $lessonTitle',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}