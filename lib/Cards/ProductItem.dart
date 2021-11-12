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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Product_details()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.mytrendyphone.eu/images/Haylou-LS02-Waterproof-Smartwatch-with-Heart-Rate-Black-6971664930443-11092020-01-p.jpg'),
                    )),
                height: 160.0,
                width: double.infinity,
              ),
              shadowColor: Colors.grey,
              elevation: 10.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            ' ${widget.products.productName}',
            style: TextStyle(
                fontSize: 15.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            ' ${widget.products.price}',
            style: TextStyle(
                fontSize: 15.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
