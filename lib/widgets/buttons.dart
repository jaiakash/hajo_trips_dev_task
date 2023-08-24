import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TourButtons extends StatelessWidget {
  const TourButtons({super.key});

  Future<void> openGoogleMaps(String place) async {
    final String mapUrl = 'https://www.google.com/maps?q=$place';
    final Uri url = Uri.parse(mapUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch browser';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 3, 58, 104),
          ),
          child: const Text('Tours from \$100'),
        ),
        ElevatedButton(
          onPressed: () {
            openGoogleMaps("placename");
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 3, 58, 104),
          ),
          child: const Text('Set as Starting Location'),
        ),
      ],
    );
  }
}
