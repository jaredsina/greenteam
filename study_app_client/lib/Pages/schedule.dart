//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:http/http.dart' as http;

Future<void> createPost(BuildContext context, String schedule, String date, String freeHours,
    String subject, int? start_time, int? end_time) async {
  final url = Uri.parse('http://127.0.0.1:4000/schedule/create');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'schedule': schedule,
      'date': date,
      'free_hours': freeHours,
      'subject': subject,
      'start_time': start_time,
      'end_time': end_time,
      'user_id': 1,
    }),
  );

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Schedule created and saved.')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to save.')),
    );
  }
}

Future<List<dynamic>> fetchScheduleList(String user_id) async {
  final url = Uri.parse('http://127.0.0.1:4000/schedule/$user_id');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final schedules_database = jsonDecode(response.body);
    return schedules_database;
  } else {
    throw Exception('Failed to load schedules');
  }
}


class Schedule extends StatefulWidget {
  const Schedule({super.key});

  final String title = 'Schedule';

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late quill.QuillController controller = quill.QuillController.basic();
  final CalendarController _calendarController = CalendarController();
  int? _startHour = 0;
  int? _endHour = 1;
  _AppointmentDataSource? _events;
  final List<Appointment> appointments = [];
  final _formKey = GlobalKey<FormState>();
  String appointmentName = '';

  // 🟦 ADDED: To store fetched schedules
  List<dynamic> fetchedSchedules = [];

  @override
  void initState() {
    super.initState();
    _events = _AppointmentDataSource(appointments);

// fetch schedules and populate both fetchedSchedules and _events appointments
fetchScheduleList("1").then((data) {
  setState(() {
    fetchedSchedules = data;
    // create appointments from the fetched schedules and add them to _events
    for (var sched in data) {
      // parse date string from backend (expected "YYYY-M-D" or ISO)
      DateTime? date;
      try {
        // try ISO parse first
        if (sched['date'] != null) {
          date = DateTime.tryParse(sched['date'].toString());
        }
        // fallback to manual split if parse failed
        if (date == null && sched['date'] != null) {
          final parts = sched['date'].toString().split('-');
          if (parts.length == 3) {
            final y = int.tryParse(parts[0]) ?? DateTime.now().year;
            final m = int.tryParse(parts[1]) ?? DateTime.now().month;
            final d = int.tryParse(parts[2]) ?? DateTime.now().day;
            date = DateTime(y, m, d);
          }
        }
      } catch (_) {
        date = DateTime.now();
      }

      // get start/end hours if present, else fallback to 0/1
      final int startHour = (sched['start_time'] is int) ? sched['start_time'] : (int.tryParse('${sched['start_time']}') ?? 0);
      final int endHour = (sched['end_time'] is int) ? sched['end_time'] : (int.tryParse('${sched['end_time']}') ?? (startHour + 1));

      final DateTime startTime = date?.add(Duration(hours: startHour)) ?? DateTime.now();
      final DateTime endTime = date?.add(Duration(hours: endHour)) ?? startTime.add(const Duration(hours: 1));

      final Appointment session = Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: sched['subject'] ?? '',
        color: Colors.blue,
      );

      _events?.appointments!.add(session);
    }

    // notify once after adding all appointments
    _events?.notifyListeners(CalendarDataSourceAction.add, _events!.appointments!);
  });
}).catchError((e) {
  print('Error fetching schedules in initState: $e');
});

  }

  Future<void> _fetchLatestSchedule() async {
    try {
      final url = Uri.parse('http://127.0.0.1:4000/schedule/');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> schedules = jsonDecode(response.body);
        print(schedules);
        if (schedules.isNotEmpty) {
          final latestSchedule = schedules.last;
          final scheduleContent = latestSchedule['schedule'];
          final doc = quill.Document.fromJson(jsonDecode(scheduleContent));

          setState(() {
            controller = quill.QuillController(
              document: doc,
              selection: const TextSelection.collapsed(offset: 0),
            );
          });
        }
      } else {
        print("Error fetching schedule: ${response.body}");
      }
    } catch (e) {
      print("Error fetching schedule: $e");
    }
  }

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
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a subject to study',
                    ),
                    validator: (String? value) {
                      if (value?.length == 0) {
                        return "Subject name cannot be empty";
                      }
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
                            DateTime? selectedDate =
                                _calendarController.selectedDate;
                            if (selectedDate == null) {
                              print("Pick a date.");
                              return;
                            }
                            String formattedDate =
                                "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                            String freeHoursRange =
                                "${_startHour}:00 - ${_endHour}:00";

                            createPost(
                              context,
                              "schedule",
                              freeHoursRange,
                              formattedDate,
                              appointmentName,
                              _startHour,
                              _endHour,
                            );

                            print("Form is valid");
                          } else {
                            print("Form is invalid");
                            return;
                          }

                          DateTime? startDate =
                              _calendarController.selectedDate;
                          DateTime? endDate = _calendarController.selectedDate;

                          if (startDate == null || endDate == null) {
                            print("Pick a date.");
                            return;
                          }

                          DateTime? startTime =
                              startDate?.copyWith(hour: _startHour);
                          DateTime? endTime =
                              endDate?.copyWith(hour: _endHour);

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
                      child: Text("Free Hours"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (fetchedSchedules.isNotEmpty)
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fetchedSchedules.length,
                itemBuilder: (context, index) {
                  final sched = fetchedSchedules[index];
                  return Container(
                    width: 250,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 103, 181, 250),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Subject: ${sched['subject'] ?? 'N/A'}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text("Date: ${sched['date'] ?? 'N/A'}"),
                        Text("Free Hours: ${sched['free_hours'] ?? 'N/A'}"),
                      ],
                    ),
                  );
                },
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
                showAgenda: true,
                agendaItemHeight: 40,
                agendaViewHeight: 150,
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
