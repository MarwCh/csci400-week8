import 'package:flutter/material.dart';
import 'item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _sum = 0; // holds total price for selected items
  bool _showSelected = false;

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     if (MediaQuery.of(context).orientation == Orientation.landscape) {
       screenWidth = screenWidth * 0.8;
     }

    return Scaffold(
        appBar: AppBar(
          // displays the total price
          title: Text('Total Price: \$$_sum'),
          centerTitle: true,
          actions: [
            // displays reset icon in AppBar
            Tooltip(
                message: 'Reset selection',
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _sum = 0;
                      for (var e in items) {
                        e.selected = false;
                      }
                      _showSelected = false;
                    });
                  },
                  icon: const Icon(
                    Icons.restore,
                  ),
                )),
            // displays show selected icon in AppBar
            Tooltip(
                message: 'Show/Hide Selected Items',
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _showSelected = !_showSelected;
                    });
                  },
                  icon: const Icon(
                    Icons.shopping_cart_checkout,
                  ),
                ))
          ],
        ),
        // check if we need to display selected items or menu
        // it depends on the _showSelected field
        body: _showSelected && _sum != 0 ? ShowSelectedItems(width: screenWidth) :
        ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Row(children: [
                          SizedBox(width: screenWidth * 0.24),
                          Checkbox(
                              value: items[index].selected,
                              onChanged: (e) {
                                items[index].selected = e as bool;
                                if (items[index].selected) {
                                  // add its price to total price
                                  _sum += items[index].price;
                                } else {
                                  // subtract its price from total price
                                  _sum -= items[index].price;
                                }
                                setState(() {});
                              }),
                          Text(items[index].toString()),
                        ]),
                        // get image from url stored in Item image field
                        Image.network(items[index].image,
                            height: screenWidth * 0.3),
                      ]);
                    },
                  )
        );
  }
}
