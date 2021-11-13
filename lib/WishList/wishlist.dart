import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Cards/ProductItem.dart';
import 'package:primespot/Cards/ProductWishlist.dart';
import 'package:primespot/Models/ProductItem.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<ProductItem> list = [];

  getProducts() {
    FirebaseFirestore.instance
        .collection('Buyer')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .collection('Wishlist')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          list.add(ProductItem.fromMap(element.data()));
        });
      });
    });
  }

  void initState() {
    getProducts();
    super.initState();
    print('${list.length} WishList Lengthrr');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Wishlist'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ProductCardWishlist(
                  products: list[index],
                );
              }),
        ),
      ),
    );
  }
}
