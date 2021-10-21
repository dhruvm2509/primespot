import 'package:flutter/material.dart';
import 'package:primespot/Login/LoginPage.dart';

var seller = false;

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
            child: Image.asset(
              'assets/back (2).jpg',
              height: 800.0,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0, left: 30.0, right: 30.0),
            child: Container(
              width: 350.0,
              height: 400.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 7.0),
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/lock 2.webp'),
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80.0, top: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: ElevatedButton(
                    child: Text(
                      'Login  as  Buyer',
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20.0,
                      ),
                      primary: Colors.black.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen(isseller: false)));
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
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20.0,
                      ),
                      primary: Colors.black.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen(isseller: true)));
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
