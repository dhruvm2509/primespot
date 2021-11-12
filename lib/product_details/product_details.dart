import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:primespot/Cards/AddProduct.dart';
import 'package:primespot/category/mobile_accessories.dart';

class Product_details extends StatefulWidget {
  const Product_details({Key? key}) : super(key: key);

  @override
  _Product_detailsState createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 300),
        //       child: Container(
        //         width: 60.0,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //               topRight: Radius.circular(25.0),
        //               bottomRight: Radius.circular(25.0)),
        //           color: Colors.amber,
        //         ),
        //         child: IconButton(
        //           onPressed: () => Navigator.pop(context,
        //               MaterialPageRoute(builder: (context) => Mobile())),
        //           icon: Icon(
        //             Icons.chevron_left,
        //             color: Colors.black,
        //             size: 35.0,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        body: Stack(
          children: [
            Container(
              height: 360.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.mytrendyphone.eu/images/Haylou-LS02-Waterproof-Smartwatch-with-Heart-Rate-Black-6971664930443-11092020-01-p.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Container(
                width: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  color: Colors.yellow,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Mobile())),
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 35.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 360,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    )),
                child: SingleChildScrollView(
                  child: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.yellow,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(25.0),
                    //       topRight: Radius.circular(25.0),
                    //     )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 10.0),
                              Text(
                                'Smartwatch',
                                style: TextStyle(
                                  fontFamily: 'NotoSerif-BoldItalic',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              SizedBox(width: 120.0),
                              Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, bottom: 15.0),
                                  child: Text(
                                    'Xiaomi Haylou LS02 Waterproof Smartwatch with Heart Rate - Bluetooth 5.0, IP68, IOS 8.0, Android 4.4 If you are looking for a multifunctional bluetooth smartwatch and all-day companionship, then Xiaomi Haylou LS02 is the right watch for you!Personal health care intelligent manager with twelve built-in sports modes will help you record and analyze all data. Thanks to an optical heart rate sensor on the back of the watch combined with an intelligent heart rate algorithm, this smartwatch will be continually monitoring your heart rate. The Xiaomi Haylou LS02 smartwatch can identify and record your deep sleep, light sleep, and awake state, quantify your sleep quality.Also, you can control the music player, receive calls, messages, and check calendar events by paring your smartwatch with your smartphone via Bluetooth 5.0. Xiaomi Haylou LS02 is characterized by long-term battery life: It works up to 20 days with 24-hour heart rate monitoring, but up to 30 days in standard-by mode.',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            elevation: 10.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 20.0,
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.upload),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Buy",
                                      style: TextStyle(
                                          letterSpacing: 2.0,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 20.0,
                                  primary: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.directions),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Directions",
                                      style: TextStyle(
                                          letterSpacing: 2.0,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
