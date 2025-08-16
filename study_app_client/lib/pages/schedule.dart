import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  final String title = 'Schedule';

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final CalendarController _calendarController = CalendarController();
  DateTime? startDate;
  DateTime? endDate;
  int? _startHour = 0;
  int? _endHour = 1;
  CalendarDataSource<Object?>? _events;
  final _formKey = GlobalKey<FormState>();

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your free hours'),
          actions: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField(
                    onChanged: (int? i) {
                      setState(() {
                        _startHour = i;
                      });
                    },
                    value: _startHour,
                    items: [
                      for (var i = 0; i <= 24; i++)
                        DropdownMenuItem(value: i, child: Text("$i")),
                    ],
                    validator: (int? value) {
                      if (value == null) {
                        return "Select a start hour";
                      } else if (value > _endHour!) {
                        return "Start hour must come before end hour.";
                      } else {
                        return null;
                      }
                    },
                  ),

                  Text('to', style: TextStyle(fontSize: 18)),

                  DropdownButtonFormField(
                    onChanged: (int? i) {
                      setState(() {
                        _endHour = i;
                      });
                    },
                    value: _endHour,
                    items: [
                      for (var i = 0; i <= 24; i++)
                        DropdownMenuItem(value: i, child: Text("$i")),
                    ],
                    validator: (int? value) {
                      if (value == null) {
                        return "Select an end hour";
                      } else if (value < _startHour!) {
                        print("end hour bad");
                        return "End hour must come after start hour";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    children: [
                      const SizedBox(height: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Enter'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Form is valid");
                          } else {
                            print("Form is invalid");
                          }

                          setState(() {
                            startDate = _calendarController.selectedDate;
                            endDate = _calendarController.selectedDate;
                          });

                          if (startDate == null || endDate == null) {
                            // TODO: Display this error somewhere
                            print("Pick a date.");
                            return;
                          }

                          DateTime? startTime = startDate?.copyWith(
                            hour: _startHour,
                          );
                          DateTime? endTime = endDate?.copyWith(hour: _endHour);

                          final Appointment session = Appointment(
                            startTime: startTime ?? DateTime.now(),
                            endTime: endTime ?? DateTime.now(),
                            subject: 'Add Appointment',
                            color: Colors.blue,
                          );
                          _events?.appointments!.add(session);
                          _events?.notifyListeners(
                            CalendarDataSourceAction.add,
                            <Appointment>[session],
                          );

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

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
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {
                        _dialogBuilder(context);
                      },
                      child: Text("Free Hours"),
                    ),

                    FilledButton(onPressed: () {}, child: const Text('Export')),
                  ],
                ),
              ],
            ),
          ),

          SfCalendar(
            view: CalendarView.month,
            controller: _calendarController,
            showNavigationArrow: true,
            onSelectionChanged: (calendarSelectionDetails) {
              print(calendarSelectionDetails);
            },
            firstDayOfWeek: 1,
            monthViewSettings: MonthViewSettings(numberOfWeeksInView: 1),
            dataSource: _events,
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
