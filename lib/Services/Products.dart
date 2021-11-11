import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/Products.dart';

class Productservices {
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
    print(list.length);
    return list;
  }
}
