import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:primespot/Dashboard/BuyerDashboard.dart';
import 'package:primespot/Profile/BuyerProfile.dart';

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          setState(() {
            currenttab = 0;
            currentScreen = BuyerDashboard();
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: currenttab == 01 ? Colors.blue : Colors.grey,
                    ),
                    Text('Profile',
                        style: TextStyle(
                          color:
                              currenttab == 1 ? Colors.blue : Colors.grey[600],
                        ))
                  ],
                ),
              ),
              // MaterialButton(
              // minWidth: 40,
              // onPressed: (){
              //   setState(() {
              //   currentScreen = History();
              //   currenttab = 2;
              //   });
              // },
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //   Icon(
              //     Icons.history,
              //     color:currenttab==2 ? Colors.blue:Colors.grey[600],

              //   ),
              //   Text(
              //     'History',
              //     style:TextStyle(
              //       color: currenttab == 2? Colors.blue : Colors.grey,
              //     )
              //   )
              // ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
