import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: 393,
            height: 852,
            child: Stack(
              fit: StackFit.expand,
              children: [
            // صورة الخلفية
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // طبقة لون أزرق داكن شفاف فوق الخلفية
            Container(
              color: const Color(0x880A2239), // أزرق داكن شفاف أكثر (خفيف)
            ),
            // محتوى الشاشة
            // محتوى الشاشة
            Column(
              children: [
                const Spacer(flex: 2), // زيادة المسافة أعلى الشعار
                Center(
                  child: SizedBox(
                    width: 291,
                    height: 172,
                    child: Image.asset(
                      'assets/images/eazy_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Spacer(flex: 3), // زيادة المسافة أسفل الشعار
                const SizedBox(
                  width: 27,
                  height: 27,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}