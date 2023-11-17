import 'package:flutter/material.dart';
import 'item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     if (MediaQuery.of(context).orientation == Orientation.landscape) {
       screenWidth = screenWidth * 0.8;
     }

    return Scaffold(
        appBar: AppBar(
          // displays the total price
          title: const Text('Menu'),
          centerTitle: true,
        ),
        // check if we need to display selected items or menu
        // it depends on the _showSelected field
        body: ShowItems(width: screenWidth)
    );
  }
}
