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
              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                height: 150.0,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 55.0,
                        child: ClipOval(
                          child: Image(
                            image: NetworkImage(widget.products.imageUrl == ""
                                ? image
                                : widget.products.imageUrl),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: 5.0,
                          // ),
                          Text(
                            ' ${widget.products.productName}',
                            style: TextStyle(
                                fontSize: 25.0,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              ' Price : Rs.${widget.products.price}/-',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(80, 35, 0, 0),
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 5, 0, 0),
                                              child: Container(
                                                height: 200.0,
                                                width: 380.0,
                                                child: ListView(
                                                  children: <Widget>[
                                                    SizedBox(height: 40),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 0, 0),
                                                      child: Center(
                                                        child: Text(
                                                          "Do you want to delete this product from your wishlist?",
                                                          style: TextStyle(
                                                              fontSize: 24,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10.0,
                                                                25.0,
                                                                30.0,
                                                                20.0),
                                                        child: ElevatedButton(
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
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
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0)),
                                                            elevation: 20.0,
                                                            primary: Colors.red,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ],
                                  )),
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
          ),
        ],
      ),
    );
  }
}
