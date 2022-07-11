import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/destination_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables,components

  int _selectedIndex = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
    FontAwesomeIcons.airbnb
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      }),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.indigo : Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: Colors.amber,
        ),
      ),
    );
  }

  // main screen itself

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Text(
                "What would you like to find?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 10,
            ),
            DestinationCarousel(),
          ],
        ),
      ),
    );
  }
}
