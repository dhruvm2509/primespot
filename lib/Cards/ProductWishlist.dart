import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Models/ProductItem.dart';
import 'package:primespot/product_details/product_details.dart';

class ProductCardWishlist extends StatefulWidget {
  final ProductItem products;
  const ProductCardWishlist({Key? key, required this.products})
      : super(key: key);

  @override
  _ProductCardWishlistState createState() => _ProductCardWishlistState();
}

class _ProductCardWishlistState extends State<ProductCardWishlist> {
  String buyerName = "";
  void initState() {
    FirebaseFirestore.instance
        .collection('Buyer')
        .doc('${FirebaseAuth.instance.currentUser!.phoneNumber}')
        .get()
        .then((value) => buyerName = value['Name']);
    super.initState();
  }

  addNotification() async {
    CollectionReference notify = FirebaseFirestore.instance
        .collection('Seller')
        .doc('${widget.products.sellerId}')
        .collection('Notifications');

    notify
        // .doc(
        //     '${widget.products.productName}${FirebaseAuth.instance.currentUser!.phoneNumber}')
        .add({
      'ProductName': widget.products.productName,
      'ProductDescription': widget.products.productDescription,
      'Price': widget.products.price,
      'Category': widget.products.category,
      'mobileNumber': FirebaseAuth.instance.currentUser!.phoneNumber,
      'buyerId': FirebaseAuth.instance.currentUser!.phoneNumber,
      'imageUrl': widget.products.imageUrl,
      'BuyerName': '$buyerName',
      'Message':
          "Your Product ${widget.products.productName} has been deleted from Wishlist",
    }).then((_) {
      print(" added Notification");
      // Navigator.pop(context);
    }).catchError((error) {
      print(error);
    });
  }

  String image =
      'https://www.mytrendyphone.eu/images/Haylou-LS02-Waterproof-Smartwatch-with-Heart-Rate-Black-6971664930443-11092020-01-p.jpg';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Product_details(products: widget.products)));
              },
              child: Card(
                color: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(widget.products.imageUrl == ""
                                ? image
                                : widget.products.imageUrl),
                          )),
                      height: 150.0,
                      width: 140.0,
                    ),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 5.0,
                        // ),
                        Text(
                          ' ${widget.products.productName}',
                          style: TextStyle(
                              fontSize: 25.0,
                              // letterSpacing: 1.0,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          ' Price : Rs.${widget.products.price}/-',
                          style: TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 0, 0),
                          child: Container(
                            child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          elevation: 16,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 5, 0, 0),
                                            child: Container(
                                              height: 200.0,
                                              width: 380.0,
                                              child: ListView(
                                                children: <Widget>[
                                                  SizedBox(height: 20),
                                                  Center(
                                                    child: Text(
                                                      "Are you sure you want to delete this product from your wishlist?",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              30.0,
                                                              25.0,
                                                              30.0,
                                                              20.0),
                                                      child: ElevatedButton(
                                                        child: Text('Yes'),
                                                        onPressed: () {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Buyer/${FirebaseAuth.instance.currentUser!.phoneNumber}/Wishlist')
                                                              .doc(
                                                                  '${widget.products.productName + widget.products.sellerId}')
                                                              .delete();

                                                          print(
                                                              'Document Deleted');
                                                          addNotification();
                                                          Navigator.pop(
                                                              context);
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
                                          ),
                                        );
                                      });
                                },
                                child: Icon(Icons.delete)),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
                shadowColor: Colors.grey,
                elevation: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
