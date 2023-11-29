// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'main.dart';

class ResultScreen extends StatelessWidget {
  final Bread selectedBread;
  final String nameBread;
  final int breadPrice;
  final ToppingOrNot toppingOrNot;
  final Topping? selectedTopping;
  final String nameBurn;
  final int burnPrice;
  final int totalPrice;

  const ResultScreen({
    Key? key,
    required this.selectedBread,
    required this.toppingOrNot,
    required this.nameBread,
    required this.selectedTopping,
    required this.nameBurn,
    required this.breadPrice,
    required this.totalPrice,
    required this.burnPrice
  }) : super(key: key);

  String convertToppingToString(Topping? topping) {
    if (topping == null) {
      return 'No Topping';
    }

    switch (topping) {
      case Topping.chocholate:
        return 'Chocholate';
      case Topping.cheese:
        return 'Cheese';
      case Topping.vanilla:
        return 'Vanilla';
      case Topping.strawberry:
        return 'Strawberry';
      case Topping.peanut:
        return 'Peanut';
      case Topping.pineapple:
        return 'Pineapple';
      default:
        return 'No Topping';
    }
  }

  int calculateToppingPrice(Topping? topping) {
    if (topping == null) {
      return 0; // Tidak ada topping, harga 0
    }

    switch (topping) {
      case Topping.chocholate:
        return 2000;
      case Topping.cheese:
        return 2500;
      case Topping.vanilla:
        return 1500;
      case Topping.strawberry:
        return 2000;
      case Topping.peanut:
        return 1000;
      case Topping.pineapple:
        return 2000;
      default:
        return 0; // Default, harga 0
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
            image: AssetImage('images/mkbread.png'),
            fit: BoxFit.contain,
            height: 70),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            'Your Order Summary',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 84, 132, 231),
                fontSize: 25),
          ),
          SizedBox(height: 20),
          Padding(padding: EdgeInsets.all(20)),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 84, 132, 231)),
            width: 300,
            height: 200,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${nameBread}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      'Rp ${breadPrice}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${convertToppingToString(selectedTopping)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      'Rp ${calculateToppingPrice(selectedTopping)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ],
                ),
                                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${nameBurn}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      'Rp ${burnPrice}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'TOTAL : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                     Text('\Rp $totalPrice', style: TextStyle(fontSize: 30,
                     color: Colors.white,
                     fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
