// @dart=2.9
import 'package:flutter/material.dart';
import 'package:primespot/Login/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PrimeSpot',
      routes: {
        '/': (context) => LoginScreen(),
      },
    );
  }
}
