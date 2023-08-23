import 'package:flutter/material.dart';
import 'package:hajo_trips_dev_task/screens/day_by_day.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajo Trips'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue[200],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.local_taxi),
            icon: Icon(Icons.local_taxi_outlined),
            label: 'Book a Vehicle',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_month),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Day By Day',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Home Page'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Book a Vehicle Page'),
        ),
        Container(
          alignment: Alignment.center,
          child: const DaybyDayScreen(),
        ),
      ][currentPageIndex],
    );
  }
}
