import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:hajo_trips_dev_task/widgets/buttons.dart';
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
                      children: city["places"].asMap().entries.map<Widget>(
                        (entry) {
                          int index = entry.key;
                          var place = entry.value;
                          bool isDeleted = _hiddenPlaces.contains(index);

                          return isDeleted
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    index != 0
                                        ? const TimeDistanceSpacer()
                                        : const SizedBox(),
                                    Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 150,
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      top: Radius.circular(8)),
                                              child: Image.network(
                                                place["image"],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  place["placename"],
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  place["description"],
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(height: 0),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton.icon(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (isDeleted) {
                                                        _hiddenPlaces
                                                            .remove(index);
                                                      } else {
                                                        _hiddenPlaces
                                                            .add(index);
                                                      }
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete_outline,
                                                    color: Color.fromARGB(
                                                        255, 3, 58, 104),
                                                  ),
                                                  label: Text(
                                                    isDeleted
                                                        ? "Undo Delete"
                                                        : "Delete",
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 58, 104),
                                                    ),
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward,
                                                  color: Color.fromARGB(
                                                      255, 3, 58, 104),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const TourButtons(),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
