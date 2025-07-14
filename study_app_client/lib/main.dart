import 'package:flutter/material.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        FlutterQuillLocalizations.delegate
      ],
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(100, 44, 153, 237),
        ),
      ),
      home: const MyHomePage(title: 'Study App'),
      routes: {
        // ADD YOUR ROUTES HERE
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
        '/biology' : (context) => Biology(),
        '/chemistry' : (context) => Chemistry(),
        '/physics' : (context) => Physics(),
        '/astronomy' : (context) => Astronomy(),
        '/earth_science' : (context) => EarthScience(),
        '/food' : (context) => Food(),
        '/places' : (context) => Places(),
        '/directions' : (context) => Directions(),
        '/clothing' : (context) => Clothing(),
        '/verbs' : (context) => Verbs(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/schedule');
              },
              child: const Text('Schedule'),
            ),

          FilledButton(
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/study');
            },
            child: const Text('Study')),
          
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context,'/notes');
              },
              child: const Text('Notes')),
            ],
          ),
      ),
    );
  }
}
