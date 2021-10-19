import 'dart:async';

import 'package:flutter/material.dart';
import 'package:primespot/Login/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade100,
        body: SizedBox(
          width: 800.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  image: AssetImage('assets/Capture-modified.png'),
                  width: 120,
                  height: 120,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/s.JPG'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/r.JPG'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
