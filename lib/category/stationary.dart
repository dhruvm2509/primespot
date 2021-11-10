import 'package:flutter/material.dart';

class Stationary extends StatefulWidget {
  const Stationary({Key? key}) : super(key: key);

  @override
  _StationaryState createState() => _StationaryState();
}

class _StationaryState extends State<Stationary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            'Stationary',
            style: TextStyle(
                letterSpacing: 1.6,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
