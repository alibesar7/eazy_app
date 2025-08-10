import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_cubit.dart';
import '../../utils/app_state.dart';
import '../NotificatonsScreen/no_notficationScreen.dart';
import '../homeScreen/HomeScreen.dart';

class LessonsScreen extends StatelessWidget {
   LessonsScreen({super.key});

  // Sample lesson data
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            },
            icon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
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
            crossAxisAlignment: CrossAxisAlignment.end,
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Save icon and title row
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/save.png',
                            width: 40,
                            height: 40,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.bookmark, size: 40),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              lesson['title'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Shamel',
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Questions text (shown for all cards)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              lesson['time'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: 'Shamel',
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(
                              'assets/images/timer1.png',
                              width: 10,
                              height: 10,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.access_time, size: 10),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],

                      // Progress bar and button (only for first card)
                      if (lesson['showDetails'])
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: LinearProgressIndicator(
                                  value: lesson['progress'],
                                  backgroundColor: Colors.grey[300],
                                  color: Colors.orange,
                                  minHeight: 13,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            if (lesson['hasButton']) ...[
                              const SizedBox(width: 16),
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
            height: 60, // Your specified height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/end.png"), // YOUR BACKGROUND IMAGE
                fit: BoxFit.cover, // Or BoxFit.fill, BoxFit.contain, etc.
                onError: (exception, stackTrace) {
                  print("Error loading BottomAppBar background image: $exception");
                },
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // حسابي
                InkWell(
                  onTap: () {
                    context.read<AppCubit>().selectCategory('حسابي');
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PerInformationscreen()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/acc.png',
                        width: 24,
                        height: 24,
                        // Optionally, change icon color if it's selected
                        // color: currentIndex == 0 ? Theme.of(context).primaryColor : null,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person_outline),
                      ),
                      Text(
                        "حسابي",
                        style: TextStyle(
                          fontSize: 12,
                          // color: currentIndex == 0 ? Theme.of(context).primaryColor : null,
                        ),
                      ),
                    ],
                  ),
                ),

                // Spacer for FAB in center (the notch will handle the visual space)
                const SizedBox(width: 40),

                // دروسي
                InkWell(
                  onTap: () {
                    context.read<AppCubit>().selectCategory('دروسي');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => LessonsScreen()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/book2.png',
                        width: 24,
                        height: 24,
                        // Optionally, change icon color if it's selected
                        // color: currentIndex == 2 ? Theme.of(context).primaryColor : null,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.menu_book),
                      ),
                      Text(
                        "دروسي",
                        style: TextStyle(
                          fontSize: 12,
                          // color: currentIndex == 2 ? Theme.of(context).primaryColor : null,
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
            color: Colors.transparent, // Make BottomAppBar transparent
            elevation: 0, // Optional: remove shadow if image provides visual depth
            child: navigationItems,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent, // Make the FAB background transparent
        elevation: 0, // Remove shadow/elevation
        focusElevation: 0, // Remove elevation on focus (optional)
        hoverElevation: 0, // Remove elevation on hover (optional)
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
          width: 60, // Ensure this size works well with the FAB's default constraints
          height: 60,
        ),
      ),

    );
  }
}