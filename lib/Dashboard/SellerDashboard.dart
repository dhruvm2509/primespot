import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:primespot/Cards/AddProduct.dart';
import 'package:primespot/Models/Products.dart';
import 'package:primespot/Screens/firstpage.dart';
import 'package:primespot/Services/Products.dart';

class SellerDashboard extends StatefulWidget {
  String? documentId;

  SellerDashboard(this.documentId);
  // const SellerDashboard({Key? key}) : super(key: key);

  @override
  _SellerDashboardState createState() => _SellerDashboardState(documentId);
}

class _SellerDashboardState extends State<SellerDashboard> {
  String productName = "";
  String productDescription = "";
  String price = "";
  String mobileNumber = "";
  String sellerName = "";
  String sellerId = "";
  String? documentId;
  String? imageUrl;

  List<String> Category = [
    'Mobile Accessories',
    'Groceries',
    'Stationaries',
    'Medicines'
  ];

  _SellerDashboardState(this.documentId);

  CollectionReference users = FirebaseFirestore.instance
      .collection('Seller')
      .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
      .collection('Products');

  Future<void> addProduct() async {
    return users.add({
      'ProductName': productName,
      'ProductDescription': productDescription,
      'Price': price,
      'Category': category,
      'mobileNumber': sellerId,
      'sellerId': sellerId,
      'imageUrl': imageUrl,
    }).then((value) {
      print("$value added products value+++++++++++++++++++++++++++++++");
      Navigator.pop(context);
    }).catchError((error) {
      print(error);
    });
  }

  List<Products> allProducts = [];

  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('Seller')
        .doc(documentId)
        .get()
        .then((value) {
      sellerName = value['ShopName'];
      sellerId = value.id;
    });

    Productservices().fetchProductservices().then(
          (value) => {
            print('$value !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'),
            value.forEach(
              (element) {
                // print(
                //     '$value ---------------------------------------------------------------');
                setState(() {
                  allProducts.add(element);
                });
              },
            ),
          },
        );

    // print('${allProducts.length} Product Length');
  }

  String? category = 'Mobile Accessories';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
              child: sellerName == ""
                  ? Text(
                      'Seller\'s Dashboard',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  : Text(
                      '$sellerName',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w900,
                      ),
                    )),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPage()),
                      (route) => false);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 800.0,
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber, elevation: 18.0),
                      child: Text(
                        "Add Product",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 16,
                              child: Container(
                                height: 600.0,
                                width: 450.0,
                                child: ListView(
                                  children: <Widget>[
                                    SizedBox(height: 40),
                                    Center(
                                      child: Text(
                                        "Register Your Product",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.5),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 10.0, 30.0, 0.0),
                                      child: Text(
                                        'Product Name',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 2.0),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 30),
                                        child: (TextFormField(
                                          onChanged: (text) {
                                            productName = text;
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please enter a ProductName';
                                            }
                                            return null;
                                          },
                                        ))),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 10.0, 30.0, 0.0),
                                      child: Text(
                                        'Product Description',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 2.0),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 30),
                                        child: (TextFormField(
                                          onChanged: (text) {
                                            productDescription = (text);
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please enter some description of product';
                                            }
                                            return null;
                                          },
                                        ))),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 10.0, 30.0, 0.0),
                                      child: Text(
                                        'Price',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 2.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 30),
                                      child: (TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (text) {
                                          price = (text);
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please enter a valid Price';
                                          }
                                          return null;
                                        },
                                      )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 10.0, 30.0, 0.0),
                                      child: Text(
                                        'Category',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 2.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 30),
                                      child: DropdownButtonFormField<String>(
                                        hint: Text('Select Category'),
                                        value: category,
                                        isDense: true,
                                        icon: const Icon(Icons.arrow_downward),
                                        onChanged: (newValue) {
                                          setState(() {
                                            category = newValue;
                                          });
                                          print(category);
                                        },
                                        items: Category.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 10.0, 30.0, 0.0),
                                      child: Text(
                                        'Enter Product Image URL',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 2.0),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 30),
                                        child: (TextFormField(
                                          onChanged: (text) {
                                            imageUrl = text;
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please enter a valid mobile number';
                                            }
                                            return null;
                                          },
                                        ))),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 25.0, 30.0, 10.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            'Submit',
                                            style: TextStyle(
                                              letterSpacing: 1.5,
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          onPressed: addProduct,
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            elevation: 20.0,
                                            primary: Colors.amber,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      })),
              RefreshIndicator(
                  child: Container(
                    height: 600,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: allProducts.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
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
            ]),
          ),
        ));
  }
}
