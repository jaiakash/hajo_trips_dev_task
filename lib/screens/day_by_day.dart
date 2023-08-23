import 'package:flutter/material.dart';
import 'package:hajo_trips_dev_task/widgets/day.dart';

class DaybyDayScreen extends StatefulWidget {
  const DaybyDayScreen({super.key});

  @override
  _DaybyDayScreenState createState() => _DaybyDayScreenState();
}

class _DaybyDayScreenState extends State<DaybyDayScreen> {
  int _currentDay = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // TODO UI Fix for 7 days
          children: List.generate(4, (index) {
            final day = index + 1;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _currentDay = day;
                  });
                },
                child: Text('Day $day'),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        DayWidget(currentDay: _currentDay),
      ],
    );
  }
}
