import 'package:flutter/material.dart';

class TimeDistanceSpacer extends StatelessWidget {
  const TimeDistanceSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(height: 100),
            Icon(
              Icons.train,
              color: Colors.grey,
            ),
            SizedBox(width: 5),
            Text(
              '5KM',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 50),
            Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
            SizedBox(width: 5),
            Text(
              '1.5 hours',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
