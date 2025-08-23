import 'package:esay_app/Features/personaLinformationScreen/Presentation/views/account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_cubit.dart';
import '../../utils/app_state.dart';
import '../NotificatonsScreen/no_notficationScreen.dart';
import '../homeScreen/homeScreen.dart';

class LessonsScreen extends StatelessWidget {
  LessonsScreen({super.key});

  final List<Map<String, dynamic>> lessons = [
    {
      'title': 'الفروق بين {a-an}',
      'questions': '4 أسئلة تقييم وتمارين',
      'time': '5 دقائق',
      'progress': 0.15,
      'hasButton': true,
      'showDetails': true,
    },
    {
      'title': 'الدرس الثاني - الوظائف',
      'questions': 'قسم الكلمات',
      'time': '',
      'progress': 0.0,
      'hasButton': false,
      'showDetails': false,
    },
    {
      'title': 'الدرس الثالث - القواعد',
      'questions': 'قسم الكلمات',
      'time': '',
      'progress': 0.0,
      'hasButton': false,
      'showDetails': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // Move the back button to the right for RTL
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.arrow_back), // Standard back icon
          ),
          title: const Text(
            "دروسي",
            style: TextStyle(fontFamily: 'Shamel'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Changed to start for RTL
              children: lessons.map((lesson) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Changed to start for RTL
                      children: [
                        // Save icon and title row - icon on right for RTL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lesson['title'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Shamel',
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Image.asset(
                              'assets/images/save.png',
                              width: 40,
                              height: 40,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.bookmark, size: 40),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Questions text (shown for all cards)
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Changed to start for RTL
                          children: [
                            Text(
                              lesson['questions'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: 'Shamel',
                              ),
                            ),
                          ],
                        ),

                        // Time and timer icon (only for first card)
                        if (lesson['showDetails']) ...[
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Changed to start for RTL
                            children: [
                              Image.asset(
                                'assets/images/timer1.png',
                                width: 10,
                                height: 10,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.access_time, size: 10),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                lesson['time'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: 'Shamel',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],

                        // Progress bar and button (only for first card)
                        // استكمل button is now on the RIGHT side
                        if (lesson['showDetails'])
                          Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: lesson['progress'],
                                  backgroundColor: Colors.grey[300],
                                  color: Colors.orange,
                                  minHeight: 13,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // استكمل button on the RIGHT
                              if (lesson['hasButton'])
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2A72AD),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "استكمل",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      fontFamily: 'Shamel',
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final categories = ['حسابي', '', 'دروسي'];
            int currentIndex = categories.indexOf(state.selectedCategory);

            Widget navigationItems = Container(
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/images/end.png"),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    print(
                        "Error loading BottomAppBar background image: $exception");
                  },
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // دروسي (moved to left for RTL)
                  InkWell(
                    onTap: () {
                      context.read<AppCubit>().selectCategory('دروسي');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LessonsScreen()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/book2.png',
                          width: 24,
                          height: 24,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.menu_book),
                        ),
                        const Text(
                          "دروسي",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacer for FAB in center
                  const SizedBox(width: 40),

                  // حسابي (moved to right for RTL)
                  InkWell(
                    onTap: () {
                      context.read<AppCubit>().selectCategory('حسابي');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AccountView()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/acc.png',
                          width: 24,
                          height: 24,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person_outline),
                        ),
                        const Text(
                          "حسابي",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

            return BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              color: Colors.transparent,
              elevation: 0,
              child: navigationItems,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          onPressed: () {
            print("Home button tapped");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          },
          child: Image.asset(
            'assets/images/home2.png',
            width: 60,
            height: 60,
          ),
        ),
      ),
    );
  }
}
