import 'package:flutter/material.dart';
import 'package:flutter_travel_app/models/activity_model.dart';
import 'package:flutter_travel_app/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({required this.destination});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

Text _buildRatingStars(int rating) {
  String stars = "";
  for (int i = 0; i < rating; i++) {
    stars += "⭐ ";
  }
  return Text(stars);
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.sort_rounded),
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 35),
                    ),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.locationPin,
                            size: 15, color: Colors.red),
                        Text(
                          widget.destination.country,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    activity.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text("\$${activity.price}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                    const Text(
                                      "per Pax",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              activity.type,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            // stars
                            _buildRatingStars(activity.rating),
                            // stars
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.indigo,
                                  ),
                                  child: Text(
                                    activity.startTimes[0],
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  alignment: Alignment.center,
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.indigo,
                                  ),
                                  child: Text(
                                    activity.startTimes[1],
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15,
                      bottom: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          width: 110,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
