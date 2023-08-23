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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis
              .horizontal, // Allow scrolling horizontally if buttons overflow
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              7,
              (index) {
                final day = index + 1;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0), // Adjust button padding
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _currentDay = day;
                        },
                      );
                    },
                    child: Text('Day $day'),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: DayWidget(currentDay: _currentDay),
          ),
        ),
      ],
    );
  }
}
