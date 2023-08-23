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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0), // Adjust button padding
                      backgroundColor: _currentDay == day
                          ? const Color.fromARGB(255, 3, 58, 104)
                          : null, // Highlight color
                    ),
                    onPressed: () {
                      setState(() {
                        _currentDay = day;
                      });
                    },
                    child: Text(
                      'Day $day',
                      style: TextStyle(
                        color: _currentDay == day ? Colors.white : Colors.black,
                        // Adjust text color based on highlight
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: SingleChildScrollView(
            child: DayWidget(currentDay: _currentDay),
          ),
        ),
      ],
    );
  }
}
