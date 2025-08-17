import 'package:esay_app/utils/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
            selectedCategory: "القواعد", // Default category
            categories: [
              "القواعد",
              "كلمات",
              "الاستماع",
            ],
            latestLessons: [
              "الماضي البسيط",
              "الشروط",
            ],
            suggestedLessons: [
              "الفرق بين (صفحة)",
              "السنة سهم وتمارين",
            ],
          ),
        );

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

}

class Category {
  final String id;
  final String name;
  final String imagePath;

  const Category({
    required this.id,
    required this.name,
    required this.imagePath,
  });
}

