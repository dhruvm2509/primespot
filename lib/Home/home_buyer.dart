import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Dashboard/BuyerDashboard.dart';
import 'package:primespot/Profile/BuyerProfile.dart';
import 'package:primespot/about_us.dart';

class HomeBuyer extends StatefulWidget {
  const HomeBuyer({Key? key}) : super(key: key);

  @override
  _HomeBuyerState createState() => _HomeBuyerState();
}

String id = '';

class _HomeBuyerState extends State<HomeBuyer> {
  Future<void> getUser() async {
    await FirebaseFirestore.instance
        .collection('Buyer')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .get()
        .then((value) => id = value.id);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  int currenttab = 0;
  final List<Widget> screen = [
    BuyerDashboard(),
    BuyerProfile(FirebaseAuth.instance.currentUser!.phoneNumber),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = BuyerDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = BuyerProfile(
                        FirebaseAuth.instance.currentUser!.phoneNumber);
                    currenttab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: currenttab == 01 ? Colors.amber : Colors.black,
                    ),
                    Text('Profile',
                        style: TextStyle(
                          color: currenttab == 1 ? Colors.amber : Colors.black,
                        ))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currenttab = 0;
                    currentScreen = BuyerDashboard();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currenttab == 00 ? Colors.amber : Colors.black,
                    ),
                    Text('Home',
                        style: TextStyle(
                          color: currenttab == 0 ? Colors.amber : Colors.black,
                        ))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = About_us();
                    currenttab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      color: currenttab == 2 ? Colors.amber : Colors.black,
                    ),
                    Text('About Us',
                        style: TextStyle(
                          color: currenttab == 2 ? Colors.amber : Colors.black,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
