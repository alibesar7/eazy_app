// home_state.dart
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Category> categories;
  final Lesson? currentLesson;
  final int bannerIndex;

  const HomeLoaded({
    required this.categories,
    this.currentLesson,
    this.bannerIndex = 0,
  });

  @override
  List<Object> get props => [categories, bannerIndex, currentLesson ?? ''];
}

class Category {
  final String id;
  final String name;
  final String iconPath;

  const Category({
    required this.id,
    required this.name,
    required this.iconPath,
  });
}

class Lesson {
  final String id;
  final String title;
  final String description;
  final String duration;
  final int questionsCount;
  final double progress;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.questionsCount,
    required this.progress,
  });
}