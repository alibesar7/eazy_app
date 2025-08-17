import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.pages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              final page = controller.pages[index];
              return Center(
                child: SizedBox(
                  width: 393,
                  height: 852,
                  child: Stack(
                    children: [
                      /// Group 484116 بمقاس وتموضع ثابتين (angle=0, opacity=1)
                      const Positioned(
                        top: 340,
                        left: 51,
                        child: SizedBox(
                          width: 291,
                          height: 172,
                        ),
                      ),
                      /// Group 227: الصورة بمقاس وتموضع ثابتين (angle=0, opacity=1)
                      const Positioned(
                        top: 30,
                        left: 32,
                        child: SizedBox(
                          width: 329.2903137207031,
                          height: 330,
                          child: Image(
                            image: AssetImage('assets/images/onboarding_illustration.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      /// Group 482544: المؤشرات بمقاس وتموضع ثابتين (angle=0, opacity=1)
                      Positioned(
                        top: 420,
                        left: 172,
                        child: SizedBox(
                          width: 49,
                          height: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.pages.length,
                              (dotIndex) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: index == dotIndex
                                      ? (index == 2
                                          ? const Color(0xFFFFA53A)
                                          : const Color(0xFF4A6FA5))
                                      : const Color(0xFFDADADA),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      /// عنوان الصفحة بمقاس وتموضع ثابتين (angle=0, opacity=1)
                      Positioned(
                        top: 460,
                        left: 26,
                        child: SizedBox(
                          width: 341,
                          height: 27,
                          child: Center(
                            child: Text(
                              page['title']!,
                              style: const TextStyle(
                                fontFamily: 'FF Shamel Family',
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                height: 1.35, // line-height 135%
                                letterSpacing: 0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      /// الوصف بمقاس وتموضع ثابتين (angle=0, opacity=1)
                      const Positioned(
                        top: 500,
                        left: 36,
                        child: SizedBox(
                          width: 321,
                          height: 72,
                          child: Center(
                            child: Text(
                              'هذا النص هو مثال لنص يمكن أن يستبدل في \n نفس المساحة، لقد تم توليد هذا النص.\nهذا النص هو مثال لنص يمكن.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6D6D6D),
                                fontFamily: 'Cairo',
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      /// زر "ابدأ" Positioned بمقاس ومكان ثابتين (Button/Large/Primary)
                      if (index == 2)
                        Positioned(
                          top: 620,
                          left: 27,
                          child: SizedBox(
                            width: 340,
                            height: 51,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFA53A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 48),
                              ),
                              onPressed: () => controller.onNext(index),
                              child: const Text(
                                'ابدأ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ),
                          ),
                        ),

                      /// المحتوى الرئيسي في المنتصف (تم تنظيفه)
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            /// لا توجد عناصر هنا، كل العناصر مثبتة Positioned أعلاه
                          ],
                        ),
                      ),

                      /// زر "التالي" مثبت في الأسفل إذا لم تكن الشاشة الأخيرة
                      if (index != 2)
                        Positioned(
                          bottom: 40,
                          left: 16,
                          child: SizedBox(
                            width: 231,
                            height: 57,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4A6FA5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () => controller.onNext(index),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.white),
                                  SizedBox(width: 30),
                                  Text(
                                    'التالي',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      // زر "تخطي" Positioned بمقاس ومكان ثابتين (angle=0, opacity=1)
                      if (index != 2)
                        Positioned(
                          top: 634,
                          left: 316,
                          child: SizedBox(
                            width: 45,
                            height: 30,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(45, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                foregroundColor: const Color(0xFFB5B5B5),
                              ),
                              onPressed: controller.onSkip,
                              child: const Text(
                                'تخطي',
                                style: TextStyle(
                                  color: Color(0xFFB5B5B5),
                                  fontSize: 14,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
