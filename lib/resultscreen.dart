// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stroke_text/stroke_text.dart';

class ResultScreen extends StatelessWidget {
  final Bread selectedBread;
  final String nameBread;
  final int breadPrice;
  final ToppingOrNot toppingOrNot;
  final Topping? selectedTopping;
  final String nameBurn;
  final int burnPrice;
  final int totalPrice;

  const ResultScreen(
      {Key? key,
      required this.selectedBread,
      required this.toppingOrNot,
      required this.nameBread,
      required this.selectedTopping,
      required this.nameBurn,
      required this.breadPrice,
      required this.totalPrice,
      required this.burnPrice})
      : super(key: key);

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
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20)),
            StrokeText(
              text: 'Your Order Summary',
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.yellow,
              ),
              strokeColor: Colors.black,
              strokeWidth: 1,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 84, 132, 231)),
              width: 350,
              height: 200,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            '${nameBread}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                      ),
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Rp ${breadPrice}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            '${convertToppingToString(selectedTopping)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                      ),
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Rp ${calculateToppingPrice(selectedTopping)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            '${nameBurn}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                      ),
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Rp ${burnPrice}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            'TOTAL',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                      ),
                      Container(
                        width: 125,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Rp ${totalPrice}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            StrokeText(
              text: 'Scan QR Code for Payment',
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.yellow,
              ),
              strokeColor: Colors.black,
              strokeWidth: 1,
            ),
            QrImageView(
              data: '''
              Your Order:
              ${nameBread}: Rp.${breadPrice}
              ${convertToppingToString(selectedTopping)}: Rp.${calculateToppingPrice(selectedTopping)}
              ${nameBurn}: Rp.${burnPrice}


              Total: Rp.${totalPrice}
              Thank you for your purchase
              ''',
              version: QrVersions.auto,
              size: 150,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 50,
        color: Color.fromARGB(255, 84, 132, 231),
        alignment: Alignment.center,
        child: Text(
          'Get Problem? Contact us here',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
