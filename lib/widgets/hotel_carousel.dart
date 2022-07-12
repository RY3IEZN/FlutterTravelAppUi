import 'package:flutter/material.dart';
import 'package:flutter_travel_app/models/destination_model.dart';
import 'package:flutter_travel_app/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

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
                "Exclusive Hotels",
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
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                width: 250,
                margin: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120,
                        width: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                hotel.name,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                hotel.address,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "\$${hotel.price} / night",
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          height: 170,
                          width: 220,
                          fit: BoxFit.cover,
                          image: AssetImage(hotel.imageUrl),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
