import 'dart:ui';

import 'package:flutter/material.dart';

class About_us extends StatelessWidget {
  const About_us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 80.0,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0))),
              elevation: 20.0,
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/Capture-modified.png'),
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/s.JPG'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 545,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://us.123rf.com/450wm/ddkolos/ddkolos1904/ddkolos190400305/121407291-beautiful-young-happy-asian-woman-in-a-stylish-beret-and-sweater-with-a-colorful-shopping-bag-using-.jpg?ver=6',
                                ),
                                fit: BoxFit.fitWidth),
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          width: 350.0,
                          height: 300.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 260.0, top: 70.0),
                        child: Text(
                          'Loved It !',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.0,
                              fontSize: 30.0,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 10, right: 20.0),
                    child: Container(
                      height: 220.0,
                      width: 300.0,
                      child: Text(
                        'Prime Spot is a one-stop solution for all our daily shopping needs. With this app, one can  buy their daily essentials (like grocery items, Mobile Accessories, Medicine, stationary and Many more) within their city. ',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                            color: Colors.amber),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0, left: 10.0),
                        child: Container(
                          height: 230.0,
                          width: 150.0,
                          child: Text(
                            'This app will  provide benefits to local Shopkeepers to grow their business. They can register their  products and can sell it throughout their city range. ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                                color: Colors.green),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                          height: 250.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://img.freepik.com/free-photo/portrait-happy-baker-working-bakery-shop-using-digital-tablet-computer-talking-cell-phone_153977-1848.jpg?size=626&ext=jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 5.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Owner',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.black),
                  ),
                  Card(
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 50.0,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/hrithik-modified.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Container(
                              width: 220,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Hrithik Varshney',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1,
                                            color: Colors.amber),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'hrithikvarshney98@gmail.com',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.1,
                                            color: Colors.amber),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '7983419357',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.5,
                                            color: Colors.amber),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    elevation: 20.0,
                    margin: EdgeInsets.all(10.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 50.0,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/dhruv-modified-modified.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Container(
                              width: 220.0,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Dhruv Maheshwari',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.5,
                                            color: Colors.amber),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'dhruvm2509@gmail.com',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.5,
                                            color: Colors.amber),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '9456092025',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.5,
                                            color: Colors.amber),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    elevation: 20.0,
                    margin: EdgeInsets.all(10.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
