// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/resultscreen.dart';
import 'package:stroke_text/stroke_text.dart';

void main() {
  runApp(breadApp());
}

class breadApp extends StatelessWidget {
  const breadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bread App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ------------------------- VARIABEL ------------------------------

enum Bread { tawar, gandum }

enum Topping { chocholate, cheese, vanilla, strawberry, peanut, pineapple }

enum ToppingOrNot { pakai, tdkpakai }

enum Burn { burn, notburn }

String nameBread = 'tawar';
int breadPrice = 0;
String nameBurn = 'Burn';
int burnPrice = 0;
int toppingPrice = 0;

class _MyHomePageState extends State<MyHomePage> {
  void resetState() {
    setState(() {
      _bread = null;
      _toppingOrNot = null;
      _topping = null;
    });
  }

  Bread? _bread;
  ToppingOrNot? _toppingOrNot;
  Topping? _topping;
  Burn? _burn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// ---------------------------- APP BAR --------------------------------
      appBar: AppBar(
        title: Image(
            image: AssetImage('images/mkbread.png'),
            fit: BoxFit.contain,
            height: 70),
        centerTitle: true,
      ),

      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30, left: 20)),
          Center(
            child: StrokeText(
              text: 'Select the type of your bread',
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.yellow,
              ),
              strokeColor: Colors.black,
              strokeWidth: 2,
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 250,
                width: 195,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('images/page1version1.png'),
                        height: 150,
                        width: 150,
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 8),
                      title: Text(
                        'Roti Tawar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 84, 132, 231)),
                      ),
                      leading: Radio<Bread>(
                        value: Bread.tawar,
                        groupValue: _bread,
                        onChanged: (Bread? value) {
                          setState(() {
                            _bread = value;
                          });
                        },
                        activeColor: Color.fromARGB(255, 84, 132, 231),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                width: 195,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('images/page1version2.png'),
                        height: 150,
                        width: 150,
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 8),
                      title: Text(
                        'Roti Gandum',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 84, 132, 231)),
                      ),
                      leading: Radio<Bread>(
                        value: Bread.gandum,
                        groupValue: _bread,
                        onChanged: (Bread? value) {
                          setState(() {
                            _bread = value;
                          });
                        },
                        activeColor: Color.fromARGB(255, 84, 132, 231),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

// ---------------------------- TYPE TOPPING PAGE ---------------------------------
          Visibility(
            visible: _bread == Bread.tawar || _bread == Bread.gandum,
            child: Column(
              children: [
                Center(
                  child: StrokeText(
                    text: 'Want to add some Topping?',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow,
                    ),
                    strokeColor: Colors.black,
                    strokeWidth: 2,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    SizedBox(
                      height: 250,
                      width: 195,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage('images/topping.png'),
                              height: 150,
                              width: 150,
                            ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(left: 8),
                            title: Text(
                              'With',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 84, 132, 231)),
                            ),
                            leading: Radio<ToppingOrNot>(
                              value: ToppingOrNot.pakai,
                              groupValue: _toppingOrNot,
                              onChanged: (ToppingOrNot? value) {
                                setState(() {
                                  _toppingOrNot = value;
                                });
                              },
                              activeColor: Color.fromARGB(255, 84, 132, 231),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      width: 195,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage('images/withouttopping.png'),
                              height: 150,
                              width: 150,
                            ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(left: 8),
                            title: Text(
                              'Without',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 84, 132, 231)),
                            ),
                            leading: Radio<ToppingOrNot>(
                              value: ToppingOrNot.tdkpakai,
                              groupValue: _toppingOrNot,
                              onChanged: (ToppingOrNot? value) {
                                setState(() {
                                  _toppingOrNot = value;
                                });
                              },
                              activeColor: Color.fromARGB(255, 84, 132, 231),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
// --------------------- END OF TYPE TOPPING PAGE ------------------------

// -------------------- START PICK A TOPPING PAGE --------------------------

          Visibility(
              visible:
                  _toppingOrNot != null && _toppingOrNot == ToppingOrNot.pakai,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 160,
                        width: 130,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image:
                                    AssetImage('images/topping/chocolate.png'),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: 0),
                              title: Text(
                                'Chocho',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Topping>(
                                value: Topping.chocholate,
                                groupValue: _topping,
                                onChanged: (Topping? value) {
                                  setState(() {
                                    _topping = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 130,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage('images/topping/cheese.png'),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: 0),
                              title: Text(
                                'Cheese',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Topping>(
                                value: Topping.cheese,
                                groupValue: _topping,
                                onChanged: (Topping? value) {
                                  setState(() {
                                    _topping = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 130,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage('images/topping/vanilla.png'),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: 0),
                              title: Text(
                                'Vanilla',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Topping>(
                                value: Topping.vanilla,
                                groupValue: _topping,
                                onChanged: (Topping? value) {
                                  setState(() {
                                    _topping = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  // -------------------- BARIS KE 2 TOPPING ------------------------------
                  Row(
                    children: [
                      SizedBox(
                        height: 160,
                        width: 130,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image:
                                    AssetImage('images/topping/strawberry.png'),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: 0),
                              title: Text(
                                'Strawberry',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Topping>(
                                value: Topping.strawberry,
                                groupValue: _topping,
                                onChanged: (Topping? value) {
                                  setState(() {
                                    _topping = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 130,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage('images/topping/peanut.png'),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: 0),
                              title: Text(
                                'Peanut',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Topping>(
                                value: Topping.peanut,
                                groupValue: _topping,
                                onChanged: (Topping? value) {
                                  setState(() {
                                    _topping = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 130,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image:
                                    AssetImage('images/topping/pineapple.png'),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: 0),
                              title: Text(
                                'Pineapple',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Topping>(
                                value: Topping.pineapple,
                                groupValue: _topping,
                                onChanged: (Topping? value) {
                                  setState(() {
                                    _topping = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30))
                ],
              )),

// -------------------- END PICK A TOPPING PAGE --------------------------

// -------------------- START BURNING PAGE -----------------------------

          Visibility(
              visible: _topping == Topping.chocholate ||
                  _topping == Topping.cheese ||
                  _topping == Topping.vanilla ||
                  _topping == Topping.strawberry ||
                  _topping == Topping.peanut ||
                  _topping == Topping.pineapple ||
                  _toppingOrNot == ToppingOrNot.tdkpakai,
              child: Column(
                children: [
                  Center(
                    child: StrokeText(
                      text: 'Want your bread Burned?',
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.yellow,
                      ),
                      strokeColor: Colors.black,
                      strokeWidth: 2,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 250,
                        width: 195,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage('images/burned.png'),
                                height: 150,
                                width: 150,
                              ),
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 8),
                              title: Text(
                                'Burned',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Burn>(
                                value: Burn.burn,
                                groupValue: _burn,
                                onChanged: (Burn? value) {
                                  setState(() {
                                    _burn = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        width: 195,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage('images/notburned.png'),
                                height: 150,
                                width: 150,
                              ),
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 8),
                              title: Text(
                                'Not Burned',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 84, 132, 231)),
                              ),
                              leading: Radio<Burn>(
                                value: Burn.notburn,
                                groupValue: _burn,
                                onChanged: (Burn? value) {
                                  setState(() {
                                    _burn = value;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 84, 132, 231),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),

// --------------------- END OF BURNING PAGE ---------------------------

// --------------------- PAGE ROUTE RESULT SCREEN ------------------------
          Visibility(
            visible: _burn == Burn.burn || _burn == Burn.notburn,
            child: Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 0, 0))),
                  onPressed: () {
                    setState(() {
                      // TYPE BREAD
                      _bread = _bread;
                      if (_bread == Bread.tawar) {
                        nameBread = 'Roti Tawar';
                        breadPrice = 5000;
                      } else if (_bread == Bread.gandum) {
                        nameBread = 'Roti Gandum';
                        breadPrice = 7000;
                      }

                      // TYPE TOPPING
                      _topping = _topping;
                      if (_topping == Topping.chocholate) {
                        toppingPrice = 2000;
                      } else if (_topping == Topping.cheese) {
                        toppingPrice = 2500;
                      } else if (_topping == Topping.vanilla) {
                        toppingPrice = 1500;
                      } else if (_topping == Topping.strawberry) {
                        toppingPrice = 2000;
                      } else if (_topping == Topping.peanut) {
                        toppingPrice = 1000;
                      } else if (_topping == Topping.pineapple) {
                        toppingPrice = 2000;
                      }

                      // TYPE BURN
                      _burn = _burn;
                      if (_burn == Burn.burn) {
                        nameBurn = 'Burned';
                        burnPrice = 1000;
                      } else if (_burn == Burn.notburn) {
                        nameBurn = 'Not Burned';
                        burnPrice = 0;
                      }
                    });
                    // resetState();
                    int totalPrice = breadPrice + burnPrice + toppingPrice;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                selectedBread: _bread!,
                                // selectedBurn: _burn!,
                                breadPrice: breadPrice,
                                nameBread: nameBread,
                                toppingOrNot:
                                    _toppingOrNot ?? ToppingOrNot.tdkpakai,
                                selectedTopping: _topping,
                                nameBurn: nameBurn,
                                totalPrice: totalPrice,
                                burnPrice: burnPrice)));
                  },
                  child: Text(
                    'Confirm Your Order',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          )
// ------------------------- END OF PAGE ROUTE SCREEN ---------------------------
        ],
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
