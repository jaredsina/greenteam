import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FreeHours extends StatefulWidget {
  const FreeHours({Key? key}) : super(key: key);

  final String title = 'Free Hours';

  @override
  _FreeHoursState createState() => _FreeHoursState();
}

class _FreeHoursState extends State<FreeHours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text('Select study day(s):'),
          Expanded(
            child: SfCalendar(
              view: CalendarView.week,
              showNavigationArrow: true,
              firstDayOfWeek: 1,
              timeSlotViewSettings: TimeSlotViewSettings(
                nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
                numberOfDaysInView: 5,
                timeIntervalHeight: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
