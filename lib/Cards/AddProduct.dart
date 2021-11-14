import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/EditProduct/editProduct.dart';
import 'package:primespot/Models/Products.dart';

class ProductCard extends StatefulWidget {
  final Products products;
  const ProductCard({Key? key, required this.products}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final FocusNode myFocusNode = FocusNode();

  var id;

  getProductId() {
    FirebaseFirestore.instance
        .collection(
            'Seller/${FirebaseAuth.instance.currentUser!.phoneNumber}/Products')
        .where('ProductName', isEqualTo: widget.products.productName)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                print(element.id);
                id = element.id;
              }),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProduct(id)))
            });

    print(id);
  }

  String image =
      'https://www.mytrendyphone.eu/images/Haylou-LS02-Waterproof-Smartwatch-with-Heart-Rate-Black-6971664930443-11092020-01-p.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: InkWell(
        onTap: () {
          getProductId();
        },
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
                  ],
                ),
              ),
            ],
          ),
          shadowColor: Colors.grey.shade100,
          elevation: 20.0,
        ),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: InkWell(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: Colors.white,
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.black26,
    //             blurRadius: 5.0,
    //             offset: Offset(0.0, 5),
    //             spreadRadius: 2.0,
    //           ),
    //         ],
    //       ),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: <Widget>[
    //           ListTile(
    //               title: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text(
    //                   ' ${widget.products.productName}',
    //                   style: TextStyle(
    //                       fontSize: 25,
    //                       fontWeight: FontWeight.bold,
    //                       fontStyle: FontStyle.italic),
    //                 ),
    //               ),
    //               subtitle: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                         "Product Description : ${widget.products.productDescription}"),
    //                     Text("Price: ${widget.products.price}"),
    //                   ],
    //                 ),
    //               )),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
