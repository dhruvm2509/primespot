import 'package:flutter/material.dart';
import 'package:primespot/Models/ProductItem.dart';
import 'package:primespot/product_details/product_details.dart';

class ProductCardItem extends StatefulWidget {
  final ProductItem products;
  const ProductCardItem({Key? key, required this.products}) : super(key: key);

  @override
  _ProductCardItemState createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
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
                width: 450,
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
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        width: 170.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ),
          ),
        ],
      ),
    );
  }
}
