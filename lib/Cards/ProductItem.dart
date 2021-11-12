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
