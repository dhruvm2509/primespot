import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Screens/firstpage.dart';
import 'package:primespot/category/grocery.dart';
import 'package:primespot/category/medicines.dart';
import 'package:primespot/category/mobile_accessories.dart';
import 'package:primespot/category/stationary.dart';

class BuyerDashboard extends StatefulWidget {
  const BuyerDashboard({Key? key}) : super(key: key);

  @override
  _BuyerDashboardState createState() => _BuyerDashboardState();
}

class _BuyerDashboardState extends State<BuyerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            'Buyer Dashboard',
            style: TextStyle(
              letterSpacing: 1.6,
              fontWeight: FontWeight.bold,
            ),
          ),
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
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Select Your Category',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              Card(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mobile()));
                  },
                  child: Container(
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 3.0),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://5.imimg.com/data5/RN/RU/MY-10334144/mobile-accessories-500x500.jpg',
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
              Card(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Grocery()));
                  },
                  child: Container(
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 3.0),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvl8_We5H4FlRm4PLubXHYkSErGxmkwU9mJrJZvc05PlG57Vbey1nS_PpFAXLo6DdC8io&usqp=CAU',
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 65.0),
                child: Text(
                  'Mobile Accessories',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  'Grocery',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              Card(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Stationary()));
                  },
                  child: Container(
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 3.0),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://freebies2deals.com/wp-content/uploads/2013/08/freebies2deals-woot-school-supplies.png',
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
              Card(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Medicines()));
                  },
                  child: Container(
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 3.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://media.istockphoto.com/photos/tablet-of-pills-and-syrup-medicine-picture-id1015072450?k=20&m=1015072450&s=170667a&w=0&h=erno8OT-uUdPvtVAGPfhzO6oA3pzNQ4ElCcx6o-bKVU='),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(
                  'Stationary',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                child: Text(
                  'Medicines',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
