import 'package:flutter/material.dart';

class Medicines extends StatefulWidget {
  const Medicines({Key? key}) : super(key: key);

  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            'Medicine',
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
