import 'package:flutter/material.dart';

import 'pages/schedule.dart';

import 'pages/study_tools.dart';
import 'pages/signup_login.dart';

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
      home: const SignLog(title: 'StudyHackAI'),
      routes: {
        // ADD YOUR ROUTES HERE
        '/schedule': (context) => const Schedule(),
        '/study': (context) => const Study(),
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
        backgroundColor: Color.fromARGB(255, 44, 153, 237),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Hello, \n Nico!", style: TextStyle(fontSize: 50)),
              SearchBar(
                leading: const Icon(Icons.search),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              SizedBox(height: 20),

              // Topic Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    // Free Hours Page
                    onPressed: () {
                      Navigator.pushNamed(context, '/study');
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
                        Text('Free Hours', style: TextStyle(fontSize: 20)),
                        const Icon(Icons.schedule, size: 28),
                      ],
                    ),
                  ),

                  FilledButton(
                    // Notes Page
                    onPressed: () {
                      Navigator.pushNamed(context, '/study');
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
              SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    // Study Tools Button
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
                    // AI Helper Button
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
              SizedBox(height: 20),
              SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    // Schedule Button
                    onPressed: () {
                      Navigator.pushNamed(context, '/schedule');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 106, 173, 249),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(320, 60)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        Text('Schedule', style: TextStyle(fontSize: 25)),
                        const Icon(Icons.calendar_month, size: 28),
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
