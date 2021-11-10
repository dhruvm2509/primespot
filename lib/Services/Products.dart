import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/Products.dart';

class Productservices {
  Future<bool> postProductservices({
    String productName = "",
    String productDescription = "",
    int price = 0,
    String category = "",
    int mobileNumber = 0,
  }) async {
    Map<String, dynamic> data = {
      'ProductName': productName,
      'ProductDescription': productDescription,
      'Price': price,
      'Category': category,
      'mobileNumber': mobileNumber,
    };

    await FirebaseFirestore.instance
        .collection('Seller')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .collection('Products')
        .add(data)
        .then((value) {
      print(value);
    });
    return true;
  }

  Future<List<Products>> fetchProductservices() async {
    List<Products> list = [];

    await FirebaseFirestore.instance
        .collection('Seller')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .collection('Products')
        .get()
        .then((value) {
      // print(value.docs[0].data());
      value.docs.forEach((element) {
        list.add(Products.fromMap(element.data()));
      });
    });
    print(list);
    return list;
  }
}
