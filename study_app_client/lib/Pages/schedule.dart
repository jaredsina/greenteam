import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  int? _startHour = 0;
  int? _endHour = 1;
  _AppointmentDataSource? _events;
  final List<Appointment> appointments = [];
  final _formKey = GlobalKey<FormState>();
  String appointmentName = '';

  @override
  void initState() {
    super.initState();
    _events = _AppointmentDataSource(appointments);
  }

  Future<void> fetchSchedule(String subject) async {
    final url = Uri.parse(
      'http://localhost:4000/schedule/generate', // change base url and port to environment variable
    ); // Replace with your actual backend URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'subject': appointmentName}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('$data');
    } else {
      print('Error');
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create Study Session'),
          actions: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a subject to study',
                    ),
                    validator: (String? value) {
                      if (value?.length == 0) {
                        return "Subject name cannot be empty";
                      }
                      //use state to save inputted value and use it for subject name in appointment
                    },
                    onChanged: (String subject) {
                      setState(() {
                        appointmentName = subject;
                      });
                    },
                  ),

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
                            // Navigator.of(context).pop();
                            return;
                          }

                          DateTime? startDate =
                              _calendarController.selectedDate;
                          DateTime? endDate = _calendarController.selectedDate;

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
                            subject: appointmentName,
                            color: Colors.blue,
                          );
                          _events?.appointments!.add(session);
                          _events?.notifyListeners(
                            CalendarDataSourceAction.add,
                            <Appointment>[session],
                          );
                          setState(() {});
                          // Close the dialog menu
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

  Future<void> _aiDialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Generate Schedule'),
          actions: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a subject to study',
                    ),
                    validator: (String? value) {
                      if (value?.length == 0) {
                        return "Subject name cannot be empty";
                      }
                      //use state to save inputted value and use it for subject name in appointment
                    },
                    onChanged: (String subject) {
                      setState(() {
                        appointmentName = subject;
                      });
                    },
                  ),

                  DropdownButtonFormField(
                    onChanged: (int? i) {
                      setState(() {
                        _startHour = i;
                      });
                    },
                    initialValue: _startHour,
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
                    initialValue: _endHour,
                    items: [
                      for (var i = 0; i <= 24; i++)
                        DropdownMenuItem(value: i, child: Text("$i")),
                    ],
                    validator: (int? value) {
                      if (value == null) {
                        return "Select an end hour";
                      } else if (value < _startHour!) {
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
                            // Navigator.of(context).pop();
                            return;
                          }

                          DateTime? startDate =
                              _calendarController.selectedDate;
                          DateTime? endDate = _calendarController.selectedDate;

                          if (startDate == null || endDate == null) {
                            // TODO: Display this error somewhere
                            print("Pick a date.");
                            return;
                          }

                          print(_calendarController.selectedDate);

                          DateTime? startTime = startDate?.copyWith(
                            hour: _startHour,
                          );
                          DateTime? endTime = endDate?.copyWith(hour: _endHour);

                          // Fetch schedule
                          fetchSchedule(appointmentName);

                          setState(() {});
                          // Close the dialog menu
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
    void openDialog() {
      _dialogBuilder(context);
    }

    void openAiDialog() {
      _aiDialogBuilder(context);
    }

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
                      onPressed: _calendarController.selectedDate != null
                          ? openDialog
                          : null,
                      child: Text("Create"),
                    ),

                    FilledButton(
                      onPressed: _calendarController.selectedDate != null
                          ? openAiDialog
                          : null,
                      child: Text("Generate"),
                    ),

                    //FilledButton(onPressed: () {}, child: const Text('Export')),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              controller: _calendarController,
              showNavigationArrow: true,
              onSelectionChanged: (calendarSelectionDetails) {
                print(calendarSelectionDetails.date);
                setState(() {});
              },
              firstDayOfWeek: 1,
              monthViewSettings: MonthViewSettings(
                //numberOfWeeksInView: 4,
                //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                showAgenda: true,
                agendaItemHeight: 70,
                agendaViewHeight: 350,
              ),
              dataSource: _events,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
