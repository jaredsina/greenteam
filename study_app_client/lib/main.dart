import 'package:flutter/material.dart';
import 'package:study_app_client/pages/flashcard.dart';
import 'package:study_app_client/pages/match.dart';
import 'package:study_app_client/pages/quiz.dart';
import 'package:study_app_client/pages/quiz_create.dart';
import 'package:study_app_client/pages/quiz_end.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'Topics/ancient_civilizations.dart';
import 'Pages/notes.dart';
import 'Topics/algebra.dart';
import 'Topics/calculus.dart';
import 'Topics/european_history.dart';
import 'Pages/schedule.dart';
import 'Pages/Catagorys/literature.dart';
import 'Pages/Catagorys/history.dart';
import 'Pages/Catagorys/math.dart';
import 'Pages/Catagorys/science.dart';
import 'Pages/Catagorys/spanish.dart';
import 'Pages/study_tools.dart';
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
      localizationsDelegates: const [
        FlutterQuillLocalizations.delegate
      ],
      theme: ThemeData(),
      home: const MyHomePage(title: 'StudyHackAI'),
      routes: {
        '/schedule': (context) => const Schedule(),
        '/study': (context) => const Study(),
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
        '/study/quiz/end':(context) => const QuizEnd(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 153, 237),
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Hello,\nJanav!", style: TextStyle(fontSize: 50)),
              SizedBox(height: 20),
              SearchBar(
                leading: const Icon(Icons.search),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/schedule');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 38, 0, 255),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('Schedule', style: TextStyle(fontSize: 20)),
                        const Icon(Icons.schedule, size: 28),
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/notes');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 18, 12, 96),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('Notes', style: TextStyle(fontSize: 25)),
                        const Icon(Icons.auto_stories, size: 28),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/study');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 0, 166, 237),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('Study Tools', style: TextStyle(fontSize: 16)),
                        const Icon(Icons.design_services, size: 28),
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/study');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 0, 103, 182),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('AI Helper', style: TextStyle(fontSize: 25)),
                        const Icon(Icons.smart_toy, size: 28),
                      ],
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
