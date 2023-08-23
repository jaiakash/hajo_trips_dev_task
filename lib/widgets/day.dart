import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DayWidget extends StatefulWidget {
  final int currentDay;
  const DayWidget({Key? key, required this.currentDay}) : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    setState(() {
      _items = data["cities"];
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    final city = _items.isNotEmpty ? _items[widget.currentDay - 1] : {};
    return Column(
      children: [
        _items.isNotEmpty
            ? Card(
                key: ValueKey(city["cityname"]),
                color: Colors.amber.shade100,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(city["cityname"]),
                    ),
                    Column(
                      children: city["places"].map<Widget>((place) {
                        return Card(
                          child: ListTile(
                            title: Text(place["placename"]),
                            subtitle: Text(place["description"]),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
