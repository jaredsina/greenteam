import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  final String title = 'Home';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Text("Hello, \n Janav!", style: TextStyle(fontSize: 50)),
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
