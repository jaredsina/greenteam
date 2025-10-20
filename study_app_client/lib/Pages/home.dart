import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  final String title = 'Home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
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
