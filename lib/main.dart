 import 'package:esay_app/Features/homeScreen/homeScreen.dart';
import 'package:esay_app/utils/app_cubit.dart';
import 'package:esay_app/utils/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'Features/auth/login/view/login_view.dart';
import 'Features/auth/onboarding/view/onboarding_view.dart';
import 'Features/auth/signup/view/signup_view.dart';
import 'Features/auth/splash/view/splash_view.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit()),
        BlocProvider(create: (_) => SearchCubit()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Eazy',
      home:SplashView(),
      getPages: [
        GetPage(name: '/onboarding', page: () => const OnboardingView()),
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/signup', page: () => const SignupView()),
      ],
    );
  }
}