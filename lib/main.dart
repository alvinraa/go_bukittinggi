// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go Traveling',
      theme: ThemeData(
        primaryColor: const Color(0xFF656CD0),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Color.fromARGB(255, 237, 238, 247)),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
      // home: LoginPage(),
    );
  }
}
