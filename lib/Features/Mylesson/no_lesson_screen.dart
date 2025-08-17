import 'package:flutter/material.dart'; // Import Material
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:esay_app/utils/app_cubit.dart';    // Assuming this is your AppCubit path
import 'package:esay_app/utils/app_state.dart';

import '../homeScreen/homeScreen.dart';


// Placeholder for PerInformationscreen - Replace with your actual screen
class PerInformationscreen extends StatelessWidget {
  const PerInformationscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("PerInformationscreen")));
  }
}
// End of placeholder

class NoLessonScreen extends StatelessWidget {
  const NoLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_)=>HomeScreen()));},
              icon: Icon(Icons.arrow_forward_ios_outlined))
        ],
        // You might want an AppBar for the screen title or back button
        title: const Text(
          "دروسي", // "Notifications" or appropriate title
          style: TextStyle(fontFamily: 'Shamel'), // Example styling
        ),
        centerTitle: true,
        // automaticallyImplyLeading: true, // Shows back button if applicable
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Example: Center content
        crossAxisAlignment: CrossAxisAlignment.stretch, // Example: Stretch content
        children: [
          // Content of your NoNotficationscreen goes here
          // For example, an icon and a message:
          Image.asset('assets/images/sleep.png',width: 80,height: 80,),
          const SizedBox(height: 20),
          const Text(
            "ليس لديك اشعارات جديدة حتى الآنً", // "No notifications currently"
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontFamily: 'Shamel',
                fontWeight: FontWeight.w400
            ),
          ),
          // Add any other widgets you need for this screen's body
        ],
      ),
      // The bottomNavigationBar is a property of Scaffold
      bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          // It's good practice to define categories that exactly match what you store in AppCubit's state.selectedCategory
          // If the "middle" item is represented by a FAB and not a direct category selection,
          // then your categories list for indexing might just be ['حسابي', 'دروسي']
          // and you'd handle the FAB separately.
          // For now, let's assume 'selectedCategory' can be 'حسابي' or 'دروسي'.

          // final categories = ['حسابي', 'دروسي']; // Simpler if FAB isn't a "category"
          // int currentIndex = categories.indexOf(state.selectedCategory);
          // This currentIndex logic might need adjustment based on how your AppCubit handles
          // the selection state, especially with a FAB. Let's assume for now it's okay.

          Widget navigationItems = Container(
            height: 60, // Your specified height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/end.png"), // YOUR BACKGROUND IMAGE
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  print("Error loading BottomAppBar background image: $exception");
                  // Consider a fallback color or handling for the container if image fails
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
                    // Check if already on PerInformationscreen to avoid pushing again if not needed
                    // or use Navigator.pushReplacement if it's a main tab change.
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => const PerInformationscreen()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/acc.png',
                        width: 24,
                        height: 24,
                        // color: state.selectedCategory == 'حسابي' ? Theme.of(context).primaryColor : null,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person_outline),
                      ),
                      Text(
                        "حسابي",
                        style: TextStyle(
                          fontSize: 12,
                          // color: state.selectedCategory == 'حسابي' ? Theme.of(context).primaryColor : null,
                        ),
                      ),
                    ],
                  ),
                ),

                // Spacer for FAB in center (the notch will handle the visual space)
                // This makes sense if you also have a floatingActionButton and
                // floatingActionButtonLocation defined on the Scaffold.
                const SizedBox(width: 40),

                // دروسي
                InkWell(
                  onTap: () {
                    context.read<AppCubit>().selectCategory('دروسي');
                    if (ModalRoute.of(context)?.settings.name != "/no_notifications") { // Avoid pushing onto self
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          settings: const RouteSettings(name: "/no_notifications"), // Give route a name
                          builder: (_) => const NoLessonScreen()
                      ));
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/book2.png',
                        width: 24,
                        height: 24,
                        // color: state.selectedCategory == 'دروسي' ? Theme.of(context).primaryColor : null,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.menu_book),
                      ),
                      Text(
                        "دروسي",
                        style: TextStyle(
                          fontSize: 12,
                          // color: state.selectedCategory == 'دروسي' ? Theme.of(context).primaryColor : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );

          return BottomAppBar(
            shape: const CircularNotchedRectangle(), // Assumes a FAB will be used
            notchMargin: 8.0,
            color: Colors.transparent,
            elevation: 0,
            child: navigationItems,
          );
        },
      ),
      // If you have a Floating Action Button, define it here:
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent, // Make the FAB background transparent
        elevation: 0, // Remove shadow/elevation
        focusElevation: 0, // Remove elevation on focus (optional)
        hoverElevation: 0, // Remove elevation on hover (optional)
        highlightElevation: 0,
        onPressed: () {
          // Handle FAB tap, e.g., navigate to home or default screen
          // context.read<AppCubit>().selectCategory('home'); // Or your default category
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
          print("FAB Tapped!");
        },
        // backgroundColor: Colors.orange, // Example color
        child: Image.asset('assets/images/home2.png'), // Example Icon
      ),
    );
  }
}

