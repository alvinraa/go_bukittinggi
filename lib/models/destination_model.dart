import '../models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

//data untuk activitas pada destination fav
List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/activity_example1.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/activity_example2.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/activity_example3.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

//data untuk destination list
List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/destination_example1.jpg',
    city: 'Venice',
    country: 'Italy',
    description:
        'Kota yang terdiri dari pulau-pulau kecil yang selalu mempesona',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/destination_example2.jpg',
    city: 'Paris',
    country: 'France',
    description:
        'Sebuah kota yang sangat indah bahkan banyak yang menyebutkan kota Cinta',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/destination_example3.jpg',
    city: 'New Delhi',
    country: 'India',
    description:
        'Kota yang Unik, banyak aktivitas keagamaan, budaya, dan makanan',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/destination_example4.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description:
        'Merupakan Kota yang terkenal akan Olahraga terlebih lagi Sepakbola',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/destination_example5.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'New York yang merupakan metropolitan terpadat di dunia',
    activities: activities,
  ),
];
