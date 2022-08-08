// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_bukittinggi/widgets/destination_carousel.dart';

import '../widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0; //untuk index dari bottomNagivatorBar
  int _selectedIndex = 0; //untuk memilih index dari list _icons
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.hotel,
    FontAwesomeIcons.car,
    FontAwesomeIcons.gamepad,
  ];

  List<String> _textForIcon = ['Pesawat', 'Hotel', 'Mobil', 'Game'];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        //mengubah value selectedIndex untuk warna
        setState(() {
          _selectedIndex = index;
        });
        print(index);
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              //background warna terpilih ? warna idup : warna mati
              color: _selectedIndex == index
                  ? Theme.of(context).colorScheme.secondary
                  : Color.fromARGB(255, 238, 235, 235),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              _icons[index],
              size: 25,
              //icon warna terpilih ? warna idup : warna mati
              color: _selectedIndex == index
                  ? Theme.of(context).primaryColor
                  : Color.fromARGB(255, 157, 157, 157),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              _textForIcon[index],
              style: TextStyle(
                color: _selectedIndex == index
                    ? Color.fromARGB(255, 34, 33, 33)
                    : Color.fromARGB(255, 157, 157, 157),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'Apa yang kamu butuhkan hari ini?',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (e) => _buildIcon(e.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            DestinationCarousel(),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //hapus label
        //https://stackoverflow.com/questions/52182384/flutter-how-to-hide-remove-title-of-bottomnavigationbaritem
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        //warna selected item
        //https://stackoverflow.com/questions/49307858/style-bottomnavigationbar-in-flutter
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
            label: 'Home 1 clicked',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.globe,
              size: 20,
            ),
            label: 'Explore 2 clicked',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              //image dari internet
              backgroundImage: NetworkImage(
                // "https://i.imgur.com/gd1jhdo.gif", kucing
                // "https://i.imgur.com/Os63UKo.gif", poto goyang
                "https://i.imgur.com/4SUrRgI.gif",
              ),
            ),
            label: 'Profile 3 clicked',
          ),
        ],
      ),
    );
  }
}
