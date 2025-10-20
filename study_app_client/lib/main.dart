import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/schedule.dart';
import 'pages/study_tools.dart';
import 'pages/signup_login.dart';
import 'pages/signup.dart';
import 'pages/login.dart';
import 'package:study_app_client/pages/flashcard.dart';
import 'package:study_app_client/pages/match.dart';
import 'package:study_app_client/pages/quiz.dart';
import 'package:study_app_client/pages/quiz_create.dart';
import 'package:study_app_client/pages/quiz_end.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'Topics/ancient_civilizations.dart';
import 'pages/notes.dart';
import 'Topics/algebra.dart';
import 'Topics/calculus.dart';
import 'Topics/european_history.dart';
import 'pages/Catagorys/literature.dart';
import 'pages/Catagorys/history.dart';
import 'pages/Catagorys/math.dart';
import 'pages/Catagorys/science.dart';
import 'pages/Catagorys/spanish.dart';
import 'Topics/american_history.dart';
import 'Topics/character_development.dart';
import 'Topics/cold_war.dart';
import 'Topics/conflict.dart';
import 'Topics/figurative_language.dart';
import 'Topics/geometry.dart';
import 'Topics/pre_calculus.dart';
import 'Topics/setting.dart';
import 'Topics/vocab.dart';
import 'Topics/world_wars.dart';
import 'Topics/statistics.dart';
import 'Topics/biology.dart';
import 'Topics/chemistry.dart';
import 'Topics/physics.dart';
import 'Topics/astronomy.dart';
import 'Topics/earth_science.dart';
import 'Topics/food.dart';
import 'Topics/places.dart';
import 'Topics/directions.dart';
import 'Topics/clothing.dart';
import 'Topics/verbs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [FlutterQuillLocalizations.delegate],
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
        '/schedule': (context) => const Schedule(),
        '/study': (context) => const Study(),
        '/signlog': (context) => const SignLog(),
        '/signup': (context) => const Signup(),
        '/home': (context) => const Home(),
        '/login': (context) => const LogIn(title: 'LogIn'),
        '/notes': (context) => const Notes(),
        '/literature': (context) => const Literature(),
        '/history': (context) => const History(),
        '/math': (context) => const Math(),
        '/spanish': (context) => const Spanish(),
        '/science': (context) => const Science(),
        '/algebra': (context) => const Algebra(),
        '/american_history': (context) => AmericanHistory(),
        '/calculus': (context) => Calculus(),
        '/character_development': (context) => CharacterDevelopment(),
        '/cold_war': (context) => ColdWar(),
        '/european_history': (context) => EuropeanHistory(),
        '/conflict': (context) => Conflict(),
        '/figurative_language': (context) => FigurativeLanguage(),
        '/geometry': (context) => Geometry(),
        '/pre_calculus': (context) => PreCalculus(),
        '/setting': (context) => Setting(),
        '/vocab': (context) => Vocab(),
        '/world_wars': (context) => WorldWars(),
        '/ancient_civilizations': (context) => AncientCivilizations(),
        '/statistics': (context) => Statistics(),
        '/biology': (context) => Biology(),
        '/chemistry': (context) => Chemistry(),
        '/physics': (context) => Physics(),
        '/astronomy': (context) => Astronomy(),
        '/earth_science': (context) => EarthScience(),
        '/food': (context) => Food(),
        '/places': (context) => Places(),
        '/directions': (context) => Directions(),
        '/clothing': (context) => Clothing(),
        '/verbs': (context) => Verbs(),
        '/study/quiz/create': (context) => const CreateQuiz(),
        '/study/flashcard': (context) => const Flashcard(),
        '/study/matching': (context) => const Matching(),
        '/study/quiz': (context) => const Quiz(),
        '/study/quiz/end': (context) => const QuizEnd(),
      },
    );
  }
}
