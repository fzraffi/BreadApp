// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stroke_text/stroke_text.dart';

class ResultScreen extends StatefulWidget {
  final Bread? selectedBread;
  final String nameBread;
  final int breadPrice;
  final ToppingOrNot toppingOrNot;
  final Topping? selectedTopping;
  final Burn? selectedBurn;
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
      required this.selectedBurn,
      required this.breadPrice,
      required this.totalPrice,
      required this.burnPrice})
      : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Bread? _selectedBread;
  String _nameBread = '';
  int _breadPrice = 0;
  ToppingOrNot? _toppingOrNot;
  Topping? _selectedTopping;
  String _nameBurn = '';
  int _burnPrice = 0;
  int _totalPrice = 0;

  bool _isTawarSelected = false;
  bool _isGandumSelected = false;

  bool _isWithSelected = false;
  bool _isWithoutSelected = false;

  bool _isBurnSelected = false;
  bool _isNotBurnSelected = false;

  bool _isChocoSelected = false;
  bool _isCheeseSelected = false;
  bool _isVanillaSelected = false;
  bool _isStrawberrySelected = false;
  bool _isPeanutSelected = false;
  bool _isPineappleSelected = false;

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
    // Tentukan path gambar berdasarkan nilai selectedBread
    String imagePath = '';
    if (widget.selectedBread == Bread.tawar) {
      imagePath = 'images/page1version1.png';
    } else if (widget.selectedBread == Bread.gandum) {
      imagePath = 'images/page1version2.png';
    }

    String toppingPath = '';
    if (widget.selectedTopping == Topping.chocholate) {
      toppingPath = 'images/topping/chocolate.png';
    } else if (widget.selectedTopping == Topping.cheese) {
      toppingPath = 'images/topping/cheese.png';
    } else if (widget.selectedTopping == Topping.vanilla) {
      toppingPath = 'images/topping/vanilla.png';
    } else if (widget.selectedTopping == Topping.strawberry) {
      toppingPath = 'images/topping/strawberry.png';
    } else if (widget.selectedTopping == Topping.peanut) {
      toppingPath = 'images/topping/peanut.png';
    } else if (widget.selectedTopping == Topping.pineapple) {
      toppingPath = 'images/topping/pineapple.png';
    } else {
      toppingPath = 'images/withouttopping.png';
    }

    String burnPath = '';
    if (widget.selectedBurn == Burn.burn) {
      burnPath = 'images/burned.png';
    } else if (widget.selectedBurn == Burn.notburn) {
      burnPath = 'images/notburned.png';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Image(
            image: AssetImage('images/mkbread.png'),
            fit: BoxFit.contain,
            height: 70),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 100,
                  width: 100,
                ),
                Image.asset(
                  toppingPath,
                  height: 100,
                  width: 100,
                ),
                Image.asset(
                  burnPath,
                  height: 100,
                  width: 100,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
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
                            '${widget.nameBread}',
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
                            'Rp ${widget.breadPrice}',
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
                            '${convertToppingToString(widget.selectedTopping)}',
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
                            'Rp ${calculateToppingPrice(widget.selectedTopping)}',
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
                            '${widget.nameBurn}',
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
                            'Rp ${widget.burnPrice}',
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
                            'Rp ${widget.totalPrice}',
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
              ${widget.nameBread}: Rp.${widget.breadPrice}
              ${convertToppingToString(widget.selectedTopping)}: Rp.${calculateToppingPrice(widget.selectedTopping)}
              ${widget.nameBurn}: Rp.${widget.burnPrice}


              Total: Rp.${widget.totalPrice}
              Thank you for your purchase
              ''',
              version: QrVersions.auto,
              size: 150,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 0, 0))),
                onPressed: () {
                  // Panggil metode untuk melakukan reset data
                  _resetDataAndNavigateToHome(context);
                },
                child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        'Kembali',
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
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

  void _resetDataAndNavigateToHome(BuildContext context) {
    // Lakukan reset data di sini, sesuai dengan kebutuhan Anda
    setState(() {
      _selectedBread = null;
      _nameBread = '';
      _breadPrice = 0;
      _toppingOrNot = null;
      _selectedTopping = null;
      _nameBurn = '';
      _burnPrice = 0;
      _totalPrice = 0;
      _isTawarSelected = false;
      _isGandumSelected = false;
      _isWithSelected = false;
      _isWithoutSelected = false;
      _isBurnSelected = false;
      _isNotBurnSelected = false;
      _isChocoSelected = false;
      _isCheeseSelected = false;
      _isVanillaSelected = false;
      _isStrawberrySelected = false;
      _isPeanutSelected = false;
      _isPineappleSelected = false;
    });

    // Navigasikan ke halaman beranda
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
      (route) => false,
    );
  }
}
