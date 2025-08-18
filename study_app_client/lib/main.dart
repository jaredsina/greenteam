import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/schedule.dart';
import 'pages/study_tools.dart';
import 'pages/signup_login.dart';
import 'pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyHackerAI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color.fromARGB(100, 106, 173, 249),
        // ),
      ),
      home: const SignLog(),
      routes: {
        // ADD YOUR ROUTES HERE
        '/schedule': (context) => const Schedule(),
        '/study': (context) => const Study(),
        '/signlog': (context) => const SignLog(),
        '/signup': (context) => const SignUp(title: 'SignUp'),
        '/home': (context) => const Home(),
      },
    );
  }
}
