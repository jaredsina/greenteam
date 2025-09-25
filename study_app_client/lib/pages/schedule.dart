import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  final String title = 'Schedule';

  @override
  // ignore: library_private_types_in_public_api
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Schedule', style: TextStyle(fontSize: 28)),
                FilledButton(onPressed: () {}, child: const Text('Export')),
              ],
            ),
          ),

          Expanded(
            child: SfCalendar(
              view: CalendarView.week,
              showNavigationArrow: true,
              firstDayOfWeek: 1,
              timeSlotViewSettings: TimeSlotViewSettings(
                nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
                numberOfDaysInView: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Session> _getDataSource() {
  final List<Session> sessions = <Session>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(
    today.year,
    today.month,
    today.day,
    9,
    0,
    0,
  );
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  sessions.add(
    Session(
      'Study Session',
      startTime,
      endTime,
      const Color(0xFF0F8644),
      false,
    ),
  );
  return sessions;
}

Future<void> createAppointment(
  BuildContext context,
  date,
  time,
  String title,
) async {
  final url = Uri.parse("http://127.0.0.1:4000/schedule/appointment");
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': 1,
      'date': date,
      'time': time,
      'title': title,
    }),
    //Snackbar thingy add that
  );
}

class SessionDataSource extends CalendarDataSource {
  SessionDataSource(List<Session> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Session {
  Session(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
