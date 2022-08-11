import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_bukittinggi/models/activity_model.dart';
import 'package:go_bukittinggi/models/destination_model.dart';

class DestinationScreen extends StatelessWidget {
  final Destination destination;

  DestinationScreen({Key? key, required this.destination});

  _buildRatingStars(int rating) {
    String stars = '';

    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim(); //menghilangkan spaci di depan dan di belakang
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image(
                image: AssetImage(
                  destination.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(FontAwesomeIcons.arrowLeft),
                    iconSize: 20,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                        iconSize: 20,
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.bars),
                        iconSize: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        destination.country,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                //nantinya akan direct buka maps
                onTap: () {},
                child: const Icon(
                  FontAwesomeIcons.mapLocationDot,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemCount: destination.activities.length,
            itemBuilder: (BuildContext context, int index) {
              // return Text(widget.destination.activities[index].name);
              Activity activity = destination.activities[index];
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      40, //left
                      5, //top
                      20, //right
                      5, //bottom
                    ),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow
                                      .ellipsis, //ketika text terlalu panjang menjadi ...
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Rp. ${activity.price}K",
                                    // "Rp. 999K",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    "/ Hari",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            activity.type,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          _buildRatingStars(activity.rating),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  activity.startTimes[0],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.all(5),
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  activity.startTimes[1],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    bottom: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        width: 110,
                        image: AssetImage(activity.imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        )
      ]),
    );
  }
}
