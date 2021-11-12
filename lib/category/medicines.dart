import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Cards/ProductItem.dart';
import 'package:primespot/Models/ProductItem.dart';

class Medicines extends StatefulWidget {
  const Medicines({Key? key}) : super(key: key);

  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  @override
  final List<String> imagesList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHLdacNWjSI3Bo11I1uQe5MdWni_3bzTdGlQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-yhJKOrKcpuqLe47VPc0uyvtidQ7xhWZkPg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ16OPL1VLQtXi3BmqyrQvjhwZNHbPnxpETiQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT9gn5ksLR8qAeiigvnKHyxbHFzHi00zex0A&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL6LZ0Gb_bMzZlq5NMOm0AF0wD-gdsgC3bpg&usqp=CAU',
  ];

  List<ProductItem> allProducts = [];
  int _currentIndex = 0;

  Future fetchMedicineServices() async {
    List<String> uid = [];

    String? buyerPinCode;

    FirebaseFirestore.instance
        .collection('Buyer')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .get()
        .then((value) {
      buyerPinCode = value['PinCode'];
    });

    final snapshot = await FirebaseFirestore.instance
        .collection('Seller')
        .where('PinCode', isEqualTo: buyerPinCode)
        .get();
    snapshot.docs.forEach((doc) {
      uid.add(doc.data()['mobileNumber']);
      //print(doc.data()['mobileNumber']);
    });

    for (int i = 0; i < uid.length; i++) {
      print(uid[i]);

      final snapshot = await FirebaseFirestore.instance
          .collection('Seller/${uid[i]}/Products')
          .where('Category', isEqualTo: "Medicines")
          .get();

      snapshot.docs.forEach((doc) {
        // print(doc.data());

        setState(() {
          allProducts.add(ProductItem.fromMap(doc.data()));
        });
        // list.add(ProductItem.fromMap(doc.data()));
      });
      // print(list.length);
    }

    print(allProducts);
  }

  void initState() {
    super.initState();

    fetchMedicineServices();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            'Medicines',
            style: TextStyle(
                letterSpacing: 1.6,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            items: imagesList
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 0.0,
                      ),
                      elevation: 6.0,
                      shadowColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              item,
                              fit: BoxFit.fill,
                              height: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((urlOfItem) {
              int index = imagesList.indexOf(urlOfItem);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Color.fromRGBO(0, 0, 0, 0.8)
                      : Color.fromRGBO(0, 0, 0, 0.3),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: Text(
              'Best Sellers',
              style: TextStyle(
                  fontSize: 23.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RefreshIndicator(
                      child: Container(
                        height: 380,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: allProducts.length,
                            itemBuilder: (context, index) {
                              return ProductCardItem(
                                products: allProducts[index],
                              );
                            }),
                      ),
                      onRefresh: () {
                        return Future.delayed(
                          Duration(seconds: 1),
                          () {
                            initState();
                          },
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
