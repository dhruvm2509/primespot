import 'package:flutter/material.dart';

import 'package:primespot/Screens/buyer.dart';
import 'package:primespot/Screens/seller.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 10.0),
            child: Image(
              image: NetworkImage(
                  'https://media.istockphoto.com/vectors/sign-in-page-abstract-concept-vector-illustration-vector-id1286100689?b=1&k=20&m=1286100689&s=170667a&w=0&h=hH1SozTmztJq36dXDxUT5JAWXW54o46cDyapFJMqrEg='),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80.0, top: 370.0),
            child: Column(
              children: [
                SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: ElevatedButton(
                    child: Text(
                      'Login  as  Buyer',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 2.5),
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: ElevatedButton(
                    child: Text(
                      'Login  as  Seller',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.black,
                        width: 2.5,
                      ),
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Seller()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
