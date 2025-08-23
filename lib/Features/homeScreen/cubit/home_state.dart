import 'package:flutter/material.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Category> categories;
  final Lesson? currentLesson;
  final int bannerIndex;

  HomeLoaded({
    required this.categories,
    this.currentLesson,
    this.bannerIndex = 0,
  });

  HomeLoaded copyWith({
    List<Category>? categories,
    Lesson? currentLesson,
    int? bannerIndex,
  }) {
    return HomeLoaded(
      categories: categories ?? this.categories,
      currentLesson: currentLesson ?? this.currentLesson,
      bannerIndex: bannerIndex ?? this.bannerIndex,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class Category {
  final String name;
  final String iconPath;

  Category({required this.name, required this.iconPath});
}

class Lesson {
  final String title;
  final String duration;
  final double progress;

  Lesson({required this.title, required this.duration, required this.progress});
}