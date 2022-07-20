// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

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
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        //mengubah value selectedIndex untuk warna
        setState(() {
          _selectedIndex = index;
        });
        print(index);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          //background warna terpilih ? warna idup : warna mati
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.secondary
              : Color.fromARGB(255, 227, 227, 227),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          //icon warna terpilih ? warna idup : warna mati
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color.fromARGB(255, 108, 107, 107),
        ),
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
                'Apa yang mau kamu cari?',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 30,
            ),
            label: 'Home 1 clicked',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.globe,
              size: 30,
            ),
            label: 'Explore 2 clicked',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              //image dari internet
              backgroundImage: NetworkImage(
                "https://i.imgur.com/gd1jhdo.gif",
              ),
            ),
            label: 'Profile 3 clicked',
          ),
        ],
      ),
    );
  }
}
