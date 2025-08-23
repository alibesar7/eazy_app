import 'package:esay_app/Features/homeScreen/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Replace with your actual data loading logic
      final List<Category> categories = [
        Category(name: 'رياضيات', iconPath: 'assets/images/math.png'),
        Category(name: 'علوم', iconPath: 'assets/images/science.png'),
        Category(name: 'لغة عربية', iconPath: 'assets/images/arabic.png'),
        Category(name: 'لغة إنجليزية', iconPath: 'assets/images/english.png'),
        Category(name: 'تاريخ', iconPath: 'assets/images/history.png'),
        Category(name: 'جغرافيا', iconPath: 'assets/images/geography.png'),
      ];

      // Replace with your actual current lesson logic
      final Lesson currentLesson = Lesson(
        title: 'الكسور في الرياضيات',
        duration: '15 دقيقة',
        progress: 0.6,
      );

      emit(HomeLoaded(
        categories: categories,
        currentLesson: currentLesson,
      ));
    } catch (e) {
      emit(HomeError('Failed to load home data: $e'));
    }
  }

  void updateBannerIndex(int index) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(bannerIndex: index));
    }
  }
}