// common_questions_state.dart
part of 'common_questions_bloc.dart';


abstract class CommonQuestionsState extends Equatable {
  const CommonQuestionsState();

  @override
  List<Object> get props => [];
}

class CommonQuestionsInitial extends CommonQuestionsState {}

class CommonQuestionsLoaded extends CommonQuestionsState {
  final List<bool> expandedStates;
  final List<QuestionAnswer> questions;

  const CommonQuestionsLoaded({
    required this.expandedStates,
    required this.questions,
  });

  @override
  List<Object> get props => [expandedStates, questions];
}

class QuestionAnswer {
  final String question;
  final String answer;

  const QuestionAnswer({
    required this.question,
    required this.answer,
  });
}