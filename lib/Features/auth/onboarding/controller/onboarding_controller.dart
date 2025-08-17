import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/onboarding_viewmodel.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final OnboardingViewModel viewModel = OnboardingViewModel();
  int currentPage = 0;

  List<Map<String, String>> get pages => viewModel.pages;

  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  void onNext(int index) {
    if (index < pages.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    } else {
      Get.offAllNamed('/login');
    }
  }

  void onSkip() {
    // TODO: Navigate to login or home
  }
}
