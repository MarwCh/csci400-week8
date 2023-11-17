import 'package:flutter/material.dart';

class Item {
  final String _name;
  final double _price;

  Item(this._name, this._price);

  // getters and setters
  String get name => _name;
  double get price => _price;

  // item description is displayed in the ListView
  @override
  String toString() {
    String space = ''; // loop computes spaces between price and name
    for (int i = 0; i < 3 - _price.toString().length; i++) {
      space += ' ';
    }
    return 'Price: \$$_price $space$_name';
  }
}

// list of items, used to populate ListView
List<Item> items = [
  Item('Burger', 7),
  Item('Pizza', 10),
  Item('Salad', 6),
  Item('Fresh Juice', 5),
];


class ShowItems extends StatelessWidget {
  const ShowItems({required this.width, Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {

      return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(children: [
            const SizedBox(height: 10),
              SizedBox(width: width * 0.28),
              Text(items[index].toString(), style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10)
          ]);
        },
      );
  }
}

