import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/common_questions_bloc.dart';
import '../homeScreen/HomeScreen.dart';

class CommonQuestions extends StatelessWidget {
  const CommonQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommonQuestionsBloc()..add(LoadQuestions()),
      child: const _CommonQuestionsView(),
    );
  }
}

class _CommonQuestionsView extends StatelessWidget {
  const _CommonQuestionsView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "الأسئلة الشائعة",
            style: TextStyle(fontFamily: 'Shamel'),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            },
          ),
        ),
        body: BlocBuilder<CommonQuestionsBloc, CommonQuestionsState>(
          builder: (context, state) {
            if (state is CommonQuestionsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CommonQuestionsLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: state.questions.length,
                itemBuilder: (context, index) {
                  return _QuestionItem(
                    question: state.questions[index],
                    isExpanded: state.expandedStates[index],
                    index: index,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _QuestionItem extends StatelessWidget {
  final QuestionAnswer question;
  final bool isExpanded;
  final int index;

  const _QuestionItem({
    required this.question,
    required this.isExpanded,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        childrenPadding: const EdgeInsets.all(16),
        title: Text(
          question.question,
          style: const TextStyle(
            fontFamily: 'Shamel',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color(0xFF1C70A6),
          ),
        ),
        trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        ),
        initiallyExpanded: isExpanded,
        onExpansionChanged: (_) {
          context.read<CommonQuestionsBloc>().add(ToggleQuestionExpansion(index));
        },
        children: [
          const Divider(thickness: 1, color: Colors.grey),
          const SizedBox(height: 8),
          Text(
            question.answer,
            style: const TextStyle(
              fontFamily: 'Shamel',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}