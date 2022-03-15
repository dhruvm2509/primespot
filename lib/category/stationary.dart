import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Cards/ProductItem.dart';
import 'package:primespot/Models/ProductItem.dart';

class Stationary extends StatefulWidget {
  final List<String> uid;
  const Stationary({Key? key, required this.uid}) : super(key: key);

  @override
  _StationaryState createState() => _StationaryState(uid);
}

class _StationaryState extends State<Stationary> {
  List<String> uid;
  _StationaryState(this.uid);
  @override
  final List<String> imagesList = [
    'https://m.media-amazon.com/images/I/61pBQ64r7GL._SX679_.jpg',
    'https://ph-live-05.slatic.net/p/a11acd138c10063107fe0e456b04fdcb.jpg_720x720q80.jpg_.webp',
    'https://static-01.daraz.com.bd/p/08c379bab600f18fc144d17b35e7f3ed.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51daAFQzwZS.jpg',
    'https://www.advertgallery.com/wp-content/uploads/2018/11/add-gel-the-worlds-finest-gel-pen-ad-times-of-india-mumbai-25-11-2018.png',
  ];

  List<ProductItem> allProducts = [];
  int _currentIndex = 0;

  void initState() {
    super.initState();

    for (int i = 0; i < uid.length; i++) {
      print(uid[i]);

      FirebaseFirestore.instance
          .collection('Seller/${uid[i]}/Products')
          .where('Category', isEqualTo: "Stationaries")
          .get()
          .then((value) => value.docs.forEach((element) {
                setState(() {
                  allProducts.add(ProductItem.fromMap(element.data()));
                });
              }));
    }

    print(allProducts);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            'Stationaries',
            style: TextStyle(
                letterSpacing: 2.5,
                fontWeight: FontWeight.w900,
                fontSize: 25.0),
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
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.0,
                child: ClipOval(
                  child: Image(
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/start_53876-25533.jpg?size=338&ext=jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 140.0,
                ),
                child: Text(
                  'Best Sellers',
                  style: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RefreshIndicator(
                      child: Container(
                        height: 400,
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
