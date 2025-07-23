import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'SignUp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBar(
                leading: const Icon(Icons.search),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Enter username",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
