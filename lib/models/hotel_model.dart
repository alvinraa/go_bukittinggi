import 'activity_model.dart';

class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  List<ActivityHotel> activities;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
    required this.activities,
  });
}

// data aktifitas untuk halaman depan
// list hotel harus di ganti
List<ActivityHotel> activities = [
  ActivityHotel(
    imageUrl: 'assets/images/activity_example1.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  ActivityHotel(
    imageUrl: 'assets/images/activity_example2.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  ActivityHotel(
    imageUrl: 'assets/images/activity_example3.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

// data hotel-hotel untuk halaman depan
// list hotel harus di ganti
final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel_example1.jpg',
    name: 'The Oberoi Lombok',
    address: 'Medana Bay - Lombok',
    price: 15,
    activities: activities,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel_example2.jpg',
    name: 'Intercontinental Bali',
    address: 'Kuta Selatan - Bali',
    price: 11,
    activities: activities,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel_example4.jpg',
    name: 'Four Seasons',
    address: 'Jimbaran Bay - Bali',
    price: 13,
    activities: activities,
  ),
];
