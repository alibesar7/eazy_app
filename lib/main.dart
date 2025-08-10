import 'package:esay_app/Features/Other/common_questions.dart';
import 'package:esay_app/Features/Other/contact_us.dart';
import 'package:esay_app/Features/Other/log_out_q.dart';
import 'package:esay_app/Features/Other/share_app..dart';
import 'package:esay_app/Features/Other/terms_and_condition.dart';
import 'package:esay_app/utils/app_cubit.dart';
import 'package:esay_app/utils/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/homeScreen/HomeScreen.dart';
import 'Features/homeScreen/all_catagories.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit()),
        BlocProvider(create: (_) => SearchCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CommonQuestions(),
      ),
    ),
  );
}