// home_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    _loadInitialData();
  }

  void _loadInitialData() {
    // Mock data - replace with your actual data source
    final categories = [
      const Category(
        id: '1',
        name: "الاستماع",
        iconPath: 'assets/images/icon6.png',
      ),
      const Category(
        id: '2',
        name: "كلمات",
        iconPath: 'assets/images/icon2.png',
      ),
      const Category(
        id: '3',
        name: "القواعد",
        iconPath: 'assets/images/icon4.png',
      ),
      const Category(
        id: '4',
        name: "الاستماع",
        iconPath: 'assets/images/icon6.png',
      ),
      const Category(
        id: '5',
        name: "كلمات",
        iconPath: 'assets/images/icon5.png',
      ),
      const Category(
        id: '6',
        name: "القواعد",
        iconPath: 'assets/images/icon4.png',
      ),
    ];

    const currentLesson = Lesson(
      id: '1',
      title: "{a-an}الفروق بين",
      description: "4 أسئلة تقييم وتمارين",
      duration: "5 دقائق",
      questionsCount: 4,
      progress: 0.15,
    );

    emit(HomeLoaded(
      categories: categories,
      currentLesson: currentLesson,
    ));
  }

  void changeBannerIndex(int index) {
    final state = this.state;
    if (state is HomeLoaded) {
      emit(HomeLoaded(
        categories: state.categories,
        currentLesson: state.currentLesson,
        bannerIndex: index,
      ));
    }
  }
}