import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  final String title = 'Schedule';

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Schedule', style: TextStyle(fontSize: 32)),
              FilledButton(onPressed: () {}, child: const Text('Export')),
            ],
          ),

          CarouselView(
            scrollDirection: Axis.vertical,
            itemExtent: double.infinity,
            children: [],
          ),
        ],
      ),
    );
  }
}
