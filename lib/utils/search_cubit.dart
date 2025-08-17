import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  String _currentQuery = '';
  final List<String> _allLessons = [
    'الماضي البسيط',
    'زمن الماضي البسيط',
    'فهم القواعد',
    'تكوين الجملة في زمن الماضي البسيط',
    'القواعد الأساسية',
  ];

  SearchCubit() : super(SearchInitial());

  // Public getter for current query
  String get currentQuery => _currentQuery;

  Future<void> search(String query) async {
    _currentQuery = query.trim();

    if (_currentQuery.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      await Future.delayed(const Duration(milliseconds: 300)); // Simulate API call

      final results = _allLessons
          .where((lesson) => lesson.contains(_currentQuery))
          .toList();

      if (results.isEmpty) {
        emit(SearchEmpty(query: _currentQuery));
      } else {
        emit(SearchSuccess(results: results, query: _currentQuery));
      }
    } catch (e) {
      emit(SearchError(message: 'خطأ في البحث: ${e.toString()}'));
    }
  }

  void clearSearch() {
    _currentQuery = '';
    emit(SearchInitial());
  }
}

abstract class SearchState {}
class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchEmpty extends SearchState {
  final String query;
  SearchEmpty({required this.query});
}
class SearchSuccess extends SearchState {
  final List<String> results;
  final String query;
  SearchSuccess({required this.results, required this.query});
}
class SearchError extends SearchState {
  final String message;
  SearchError({required this.message});
}