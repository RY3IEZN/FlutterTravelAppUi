import 'package:flutter/material.dart';
import 'package:flutter_travel_app/destination_screen.dart';
import 'package:flutter_travel_app/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top destinations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {
                  print("see all");
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination,
                    ),
                  ),
                ),
                child: Container(
                  width: 210,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " ${destination.activities.length} Activities",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  destination.description,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0.0, 0.2),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Hero(
                                tag: destination.imageUrl,
                                child: Image(
                                  height: 170,
                                  width: 180,
                                  fit: BoxFit.cover,
                                  image: AssetImage(destination.imageUrl),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.locationPin,
                                          size: 15, color: Colors.red),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
