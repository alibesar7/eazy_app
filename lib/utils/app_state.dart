import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final String selectedCategory;
  final List<String> categories;
  final List<String> latestLessons;
  final List<String> suggestedLessons;

  const AppState({
    required this.selectedCategory,
    required this.categories,
    required this.latestLessons,
    required this.suggestedLessons,
  });

  // CopyWith method for immutability
  AppState copyWith({
    String? selectedCategory,
    List<String>? categories,
    List<String>? latestLessons,
    List<String>? suggestedLessons,
  }) {
    return AppState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
      latestLessons: latestLessons ?? this.latestLessons,
      suggestedLessons: suggestedLessons ?? this.suggestedLessons,
    );
  }

  @override
  List<Object> get props => [
        selectedCategory,
        categories,
        latestLessons,
        suggestedLessons,
      ];
}