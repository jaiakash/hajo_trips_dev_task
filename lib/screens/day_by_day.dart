import 'package:flutter/material.dart';

class DaybyDayScreen extends StatefulWidget {
  const DaybyDayScreen({super.key});

  @override
  _DaybyDayScreenState createState() => _DaybyDayScreenState();
}

class _DaybyDayScreenState extends State<DaybyDayScreen> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(7, (index) {
            final day = index + 1;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _currentPage = day;
                  });
                },
                child: Text('Day $day'),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            'Current Day: $_currentPage',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
