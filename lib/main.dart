import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/welcome/welcome_screen.dart';

//import 'FirstScreen.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:
          // FirstHomeScreen(),
          WelcomeScreen(),
    );
  }
}


// import 'package:flutter/material.dart';
// //import 'package:flutter_application_1/screens/welcome/welcome_screen.dart';

// //import 'FirstScreen.dart';
// import 'login.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Quiz App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home:
//           // FirstHomeScreen(),
//           WelcomeScreen(),
//     );
//   }
// }
