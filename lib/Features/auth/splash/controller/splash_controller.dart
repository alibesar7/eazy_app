import 'package:get/get.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashController extends GetxController {
  final SplashViewModel viewModel = SplashViewModel();

  @override
  void onInit() {
    super.onInit();
    viewModel.startSplashTimer();
  }
}