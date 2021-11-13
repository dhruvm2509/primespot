import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:primespot/Cards/ProductItem.dart';
import 'package:primespot/Dashboard/BuyerDashboard.dart';
import 'package:primespot/Models/ProductItem.dart';

class Mobile extends StatefulWidget {
  final List<String> uid;
  const Mobile({Key? key, required this.uid}) : super(key: key);

  @override
  _MobileState createState() => _MobileState(uid);
}

class _MobileState extends State<Mobile> {
  List<String> uid;
  _MobileState(this.uid);
  @override
  final List<String> imagesList = [
    'https://t4.ftcdn.net/jpg/02/69/84/19/360_F_269841954_IidwZ0kwyu0UruUWUZ3fRUHt9bmxQqrZ.jpg',
    'https://i0.wp.com/techobserver.in/wp-content/uploads/2021/06/Mobile-Accessories.jpg?resize=696%2C418&ssl=1',
    'https://media-eng.dhakatribune.com/uploads/2018/07/samsung-accessories-edited-1532008683956.jpg',
    'https://images.dailyobjects.com/marche/assets/images/homepage/desktop/cases-banner-desktop-update.jpg?tr=cm-pad_crop,w-412,dpr-2',
    'https://t3.ftcdn.net/jpg/02/73/31/68/360_F_273316816_N9164vXl3NTl1W50Z3o2ocQmtjBAAPOO.jpg',
  ];

  List<ProductItem> allProducts = [];
  int _currentIndex = 0;

  // Future fetchMobileservices() async {

  // }

  void initState() {
    super.initState();

    for (int i = 0; i < uid.length; i++) {
      print(uid[i]);

      FirebaseFirestore.instance
          .collection('Seller/${uid[i]}/Products')
          .where('Category', isEqualTo: "Mobile Accessories")
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
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Mobile Accessories',
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
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RefreshIndicator(
                      child: Container(
                        height: 350,
                        width: double.infinity,
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
