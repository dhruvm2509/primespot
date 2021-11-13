import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Dashboard/SellerDashboard.dart';
import 'package:primespot/Notification/notifications.dart';
import 'package:primespot/Profile/SellerProfile.dart';

import '../about_us.dart';

class HomeSeller extends StatefulWidget {
  const HomeSeller({Key? key}) : super(key: key);

  @override
  _HomeSellerState createState() => _HomeSellerState();
}

String id = '';

class _HomeSellerState extends State<HomeSeller> {
  Future<void> getUser() async {
    await FirebaseFirestore.instance
        .collection('Seller')
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
    SellerDashboard(FirebaseAuth.instance.currentUser!.phoneNumber),
    SellerProfile(FirebaseAuth.instance.currentUser!.phoneNumber),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen =
      SellerDashboard(FirebaseAuth.instance.currentUser!.phoneNumber);

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
                    currenttab = 0;
                    currentScreen = SellerDashboard(
                        FirebaseAuth.instance.currentUser!.phoneNumber);
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
                    currenttab = 1;
                    currentScreen = Notifications();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: currenttab == 1 ? Colors.amber : Colors.black,
                    ),
                    Text('Notifications',
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
                    currentScreen = SellerProfile(
                        FirebaseAuth.instance.currentUser!.phoneNumber);
                    currenttab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: currenttab == 2 ? Colors.amber : Colors.black,
                    ),
                    Text('Profile',
                        style: TextStyle(
                          color: currenttab == 2 ? Colors.amber : Colors.black,
                        ))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = About_us();
                    currenttab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      color: currenttab == 3 ? Colors.amber : Colors.black,
                    ),
                    Text('About Us',
                        style: TextStyle(
                          color: currenttab == 3 ? Colors.amber : Colors.black,
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


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(
//         child: currentScreen,
//         bucket: bucket,
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.home),
//         onPressed: () {
//           setState(() {
//             currenttab = 0;
//             currentScreen =
//                 SellerDashboard(FirebaseAuth.instance.currentUser!.phoneNumber);
//           });
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 10,
//         child: Container(
//           height: 60,
//           width: 80,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               MaterialButton(
//                 minWidth: 40,
//                 onPressed: () {
//                   setState(() {
//                     currentScreen = SellerProfile(
//                         FirebaseAuth.instance.currentUser!.phoneNumber);
//                     currenttab = 1;
//                   });
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.account_circle,
//                       color: currenttab == 01 ? Colors.blue : Colors.grey,
//                     ),
//                     Text('Profile',
//                         style: TextStyle(
//                           color:
//                               currenttab == 1 ? Colors.blue : Colors.grey[600],
//                         ))
//                   ],
//                 ),
//               ),
//               // MaterialButton(
//               // minWidth: 40,
//               // onPressed: (){
//               //   setState(() {
//               //   currentScreen = History();
//               //   currenttab = 2;
//               //   });
//               // },
//               // child: Column(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //   Icon(
//               //     Icons.history,
//               //     color:currenttab==2 ? Colors.blue:Colors.grey[600],

//               //   ),
//               //   Text(
//               //     'History',
//               //     style:TextStyle(
//               //       color: currenttab == 2? Colors.blue : Colors.grey,
//               //     )
//               //   )
//               // ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
