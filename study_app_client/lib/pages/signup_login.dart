import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }
}

class SignLog extends StatelessWidget {
  const SignLog({super.key, required String title});

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
              Text("StudyHackerAI", style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(25),
                child: FilledButton.tonal(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 100, 148, 237),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/study/quiz');
                  },
                  child: Text('Sign Up', style: TextStyle(fontSize: 25)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: FilledButton.tonal(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 103, 181, 250),
                  ),

                  onPressed: () {
                    Navigator.pushNamed(context, '/study/flashcard');
                  },
                  child: Text('Log In', style: TextStyle(fontSize: 25)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
