import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:primespot/Cards/AddProduct.dart';
import 'package:primespot/Location/google_maps.dart';
import 'package:primespot/Models/ProductItem.dart';
import 'package:primespot/category/mobile_accessories.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Product_details extends StatefulWidget {
  final ProductItem products;
  const Product_details({Key? key, required this.products}) : super(key: key);

  @override
  _Product_detailsState createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  String sellerName = "";
  String sellerShopName = "";
  String sellerShopAddress = "";
  String sellerMobile = "";
  String sellerAddress = "";
  String sellerCity = "";
  String sellerPinCode = "";
  String buyerAddress = "";
  String buyerCity = "";
  String buyerCompleteAddress = "";
  String buyerPinCode = "";

  String image =
      'https://www.mytrendyphone.eu/images/Haylou-LS02-Waterproof-Smartwatch-with-Heart-Rate-Black-6971664930443-11092020-01-p.jpg';

  final razorpay = Razorpay();
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);

    FirebaseFirestore.instance
        .collection('Seller')
        .doc(widget.products.sellerId)
        .get()
        .then((value) {
      sellerShopName = value['ShopName'];
      sellerName = value['Name'];
      sellerShopAddress = value['ShopAddress'];
      sellerMobile = value['Mobile'];
      sellerCity = value['City'];
      sellerPinCode = value['PinCode'];

      sellerAddress =
          sellerShopAddress + ',' + sellerCity + "," + sellerPinCode;
      print(sellerAddress);
    });

    FirebaseFirestore.instance
        .collection('Buyer')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .get()
        .then((value) {
      buyerAddress = value['Address'];
      buyerCity = value['City'];
      buyerPinCode = value['PinCode'];

      buyerCompleteAddress =
          buyerAddress + ',' + buyerCity + ',' + buyerPinCode;
    });
  }

  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void paySuccess(PaymentSuccessResponse response) {
    print(response.paymentId.toString());
  }

  void externalWallet(ExternalWalletResponse response) {
    print(response.walletName);
  }

  void payError(PaymentFailureResponse response) {
    print(response.message);
  }

  getPayment(int amount) {
    var option = {
      'key': 'rzp_test_x8HVnQqW8V4ugg',
      'amount': amount * 100,
      'name': sellerName,
      'prefill': {
        'contact': sellerMobile,
        'email': 'maheshwaridhruv25@gmail.com'
      },
      "external": {
        "wallets": ["paytm"]
      },
      "description": "This is a Test Payment",
      "timeout": "180",
      "theme.color": "#03be03",
      "currency": "INR",
    };

    try {
      razorpay.open(option);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 330.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(widget.products.imageUrl == ""
                        ? image
                        : widget.products.imageUrl),
                    fit: BoxFit.fill,
                  ),
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
                          child: Column(
                            children: [
                              SizedBox(width: 10.0),
                              Text(
                                '${widget.products.productName}',
                                style: TextStyle(
                                  fontFamily: 'NotoSerif-BoldItalic',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              SizedBox(width: 70.0),
                              Column(
                                children: [
                                  // Text(
                                  //   'Price',
                                  //   style: TextStyle(
                                  //     fontSize: 35.0,
                                  //     fontWeight: FontWeight.w800,
                                  //     letterSpacing: 1.5,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Rs.${widget.products.price}/-',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 250,
                            width: double.infinity,
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
                                      '${widget.products.productDescription}',
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
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          elevation: 16,
                                          child: Container(
                                            height: 450.0,
                                            width: 400.0,
                                            child: ListView(
                                              children: <Widget>[
                                                SizedBox(height: 20),
                                                Center(
                                                  child: Text(
                                                    "Seller Details",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      30.0, 10.0, 30.0, 0.0),
                                                  child: Text(
                                                    'Seller Name:',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0,
                                                            horizontal: 40),
                                                    child: Text(
                                                      sellerName,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      30.0, 20.0, 30.0, 0.0),
                                                  child: Text(
                                                    'Seller Shop Name',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 40),
                                                  child: Text(
                                                    sellerShopName,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      30.5, 20.0, 30.0, 0.0),
                                                  child: Text(
                                                    'Seller Address',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5,
                                                            horizontal: 40),
                                                    child: Text(
                                                      sellerShopAddress,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      30.0, 20.0, 30.0, 0.0),
                                                  child: Text(
                                                    'Seller Contact',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5,
                                                            horizontal: 40),
                                                    child: Text(
                                                      sellerMobile,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            25.0,
                                                            30.0,
                                                            20.0),
                                                    child: ElevatedButton(
                                                      child: Text(
                                                          'Proceed to Pay'),
                                                      onPressed: () {
                                                        getPayment(widget
                                                            .products.price);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Colors.green[600],
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
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
                                onPressed: () {
                                  print(
                                      'Seller Address $sellerAddress and buyer Addess $buyerCompleteAddress');
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MapView(
                                          sellerAddress,
                                          buyerCompleteAddress)));
                                },
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