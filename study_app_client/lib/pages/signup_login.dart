import 'package:flutter/material.dart';

class SignLog extends StatefulWidget {
  const SignLog({Key? key}) : super(key: key);

  final String title = 'SignLog';

  @override
  _SignLogState createState() => _SignLogState();
}

class _SignLogState extends State<SignLog> {
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
                    Navigator.pushNamed(context, '/signup');
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

// import 'package:flutter/material.dart';
// import './signup.dart';

// void main() {
//   runApp(const MySignLog());
// }

// class MySignLog extends StatelessWidget {
//   const MySignLog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false);
//   }
// }

// class SignLog extends StatelessWidget {
//   const SignLog({super.key, required String title});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SignLog',
//       theme: ThemeData(),
//       routes: {
//         // ADD YOUR ROUTES HERE
//         '/signup': (context) => const SignUp(title: 'SignUp'),
//       },
//     );
//   }
// }

// class _SignLog extends StatelessWidget {
//   const _SignLog({super.key, required String title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text("StudyHackerAI", style: TextStyle(fontSize: 30)),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.all(25),
//                 child: FilledButton.tonal(
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(150, 90),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Color.fromARGB(255, 100, 148, 237),
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/signup');
//                   },
//                   child: Text('Sign Up', style: TextStyle(fontSize: 25)),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(25),
//                 child: FilledButton.tonal(
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(150, 90),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Color.fromARGB(255, 103, 181, 250),
//                   ),

//                   onPressed: () {
//                     Navigator.pushNamed(context, '/study/flashcard');
//                   },
//                   child: Text('Log In', style: TextStyle(fontSize: 25)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
