import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Screens/firstpage.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Demo Page'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            child: Text('Welcome to Demo\'s page!!'),
          )
        ],
      )),
    );
  }
}
