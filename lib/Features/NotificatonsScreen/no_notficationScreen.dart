import 'package:flutter/material.dart'; // Import Material
import 'package:flutter_bloc/flutter_bloc.dart';

// --- IMPORTANT: Replace these with your actual import paths ---
import 'package:esay_app/utils/app_cubit.dart';    // Assuming this is your AppCubit path
import 'package:esay_app/utils/app_state.dart';    // Assuming this is your AppState path
import 'package:esay_app/Features/homeScreen/HomeScreen.dart'; // Or wherever PerInformationscreen is if it's different
// import 'package:your_app_name/path/to/per_informations_screen.dart';
// import 'package:your_app_name/path/to/app_cubit.dart';
// import 'package:your_app_name/path/to/app_state.dart';
// --- End of placeholder imports ---


// Placeholder for PerInformationscreen - Replace with your actual screen
class PerInformationscreen extends StatelessWidget {
  const PerInformationscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("PerInformationscreen")));
  }
}
// End of placeholder

class NoNotficationscreen extends StatelessWidget {
  const NoNotficationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap your content with a Scaffold
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>HomeScreen()));}, icon: Icon(Icons.arrow_forward_ios))
        ],
        // You might want an AppBar for the screen title or back button
        title: const Text(
          "الإشعارات", // "Notifications" or appropriate title
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
          Image.asset('assets/images/no_notf.png',width: 80,height: 80,),
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
    );
  }
}

