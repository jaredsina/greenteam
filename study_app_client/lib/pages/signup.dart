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
              Text("Sign Up", style: TextStyle(fontSize: 50)),
              SizedBox(height: 40),
              Text("Enter your Email:", style: TextStyle(fontSize: 25)),
              SearchBar(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Enter Email",
              ),

              SizedBox(height: 35),
              Text("Enter your password:", style: TextStyle(fontSize: 25)),
              SearchBar(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Enter password", // Possibly with asterisks
              ),

              SizedBox(height: 35),
              Text("Reenter your password:", style: TextStyle(fontSize: 25)),
              SearchBar(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Reenter password",
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: FilledButton.tonal(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color.fromARGB(255, 0, 174, 255),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          Text('Submit', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: FilledButton.tonal(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signlog');
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          Text('Cancel', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
