import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:primespot/Cards/ProductItem.dart';
import 'package:primespot/Dashboard/BuyerDashboard.dart';
import 'package:primespot/Models/ProductItem.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  final List<String> imagesList = [
    'https://cdn.shopify.com/s/files/1/1916/9825/files/ele.mobile_accessries_2048x2048.jpg?v=1621587344',
    'https://uidesign.gbtcdn.com/GB/image/2019/20190802_11705/banner.jpg?imbypass=true',
    'https://media-eng.dhakatribune.com/uploads/2018/07/samsung-accessories-edited-1532008683956.jpg',
    'https://images.dailyobjects.com/marche/assets/images/homepage/desktop/cases-banner-desktop-update.jpg?tr=cm-pad_crop,w-412,dpr-2',
    'https://static.india.com/wp-content/uploads/2021/04/oppo-smartphone.jpg',
  ];

  List<ProductItem> allProducts = [];
  int _currentIndex = 0;

  Future fetchMobileservices() async {
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
          .where('Category', isEqualTo: "Mobile Accessories")
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

    fetchMobileservices();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Container(
              width: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                color: Colors.amber,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => BuyerDashboard())),
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 35.0,
                ),
              ),
            ),
          ),
        ],
        title: Center(
          child: Text(
            'Mobile Accessories',
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
                        height: 350,
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
