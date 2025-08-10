// common_questions_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'common_questions_state.dart';

class CommonQuestionsBloc extends Bloc<CommonQuestionsEvent, CommonQuestionsState> {
  CommonQuestionsBloc() : super(CommonQuestionsInitial()) {
    on<LoadQuestions>(_onLoadQuestions);
    on<ToggleQuestionExpansion>(_onToggleQuestionExpansion);
  }

  void _onLoadQuestions(LoadQuestions event, Emitter<CommonQuestionsState> emit) {
    // Mock data - replace with your actual data source
    final questions = [
      const QuestionAnswer(
        question: "نص السؤال هنا والذي عادة ما يتكون من عدة أسطر هكذا المثال",
        answer: "نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر. نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.",
      ),
      const QuestionAnswer(
        question: "سؤال آخر كمثال للتجربة",
        answer: "إجابة السؤال الثاني هنا مع بعض التفاصيل الإضافية",
      ),
      const QuestionAnswer(
        question: "سؤال ثالث قد يكون أطول قليلاً من الأسئلة السابقة",
        answer: "إجابة مطولة نوعاً ما تحتوي على عدة نقاط رئيسية",
      ),
      const QuestionAnswer(
        question: "آخر سؤال في القائمة",
        answer: "إجابة مختصرة للسؤال الأخير",
      ),
    ];

    emit(CommonQuestionsLoaded(
      expandedStates: List.filled(questions.length, false),
      questions: questions,
    ));
  }

  void _onToggleQuestionExpansion(ToggleQuestionExpansion event, Emitter<CommonQuestionsState> emit) {
    final state = this.state;
    if (state is CommonQuestionsLoaded) {
      final newExpandedStates = List<bool>.from(state.expandedStates);
      newExpandedStates[event.index] = !newExpandedStates[event.index];

      emit(CommonQuestionsLoaded(
        expandedStates: newExpandedStates,
        questions: state.questions,
      ));
    }
  }
}




// common_questions_event.dart
abstract class CommonQuestionsEvent extends Equatable {
  const CommonQuestionsEvent();

  @override
  List<Object> get props => [];
}

class LoadQuestions extends CommonQuestionsEvent {}

class ToggleQuestionExpansion extends CommonQuestionsEvent {
  final int index;

  const ToggleQuestionExpansion(this.index);

  @override
  List<Object> get props => [index];
}