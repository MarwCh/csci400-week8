/*
program to display restaurant menu
allows user to select items and then computes total price
demonstrates the use of:
ListView
IconButton
adding icons to AppBar
*/

import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'csci410 week 8',
      home: Home(),
    );
  }
}
