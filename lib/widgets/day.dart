import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hajo_trips_dev_task/widgets/buttons.dart';
import 'dart:convert';

import 'package:hajo_trips_dev_task/widgets/spacer.dart';

class DayWidget extends StatefulWidget {
  final int currentDay;
  const DayWidget({Key? key, required this.currentDay}) : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  List _items = [];
  final List<int> _hiddenPlaces = [];

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
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          city["cityname"],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children:
                          city["places"].asMap().entries.map<Widget>((entry) {
                        int index = entry.key;
                        var place = entry.value;
                        bool isHidden = _hiddenPlaces.contains(index);

                        return isHidden
                            ? const SizedBox()
                            : Column(
                                children: [
                                  index != 0
                                      ? const TimeDistanceSpacer()
                                      : const SizedBox(),
                                  Card(
                                    child: Column(
                                      children: [
                                        Image.network(
                                          place["image"],
                                          width: double.infinity,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        ListTile(
                                          title: Text(place["placename"]),
                                          subtitle: Text(place["description"]),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (isHidden) {
                                                    _hiddenPlaces.remove(index);
                                                  } else {
                                                    _hiddenPlaces.add(index);
                                                  }
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Color.fromARGB(
                                                    255, 3, 58, 104),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const TourButtons()
                                      ],
                                    ),
                                  ),
                                ],
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
