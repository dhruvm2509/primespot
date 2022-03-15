import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Cards/NotificationCard.dart';
import 'package:primespot/Models/NotificationItem.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationItem> list = [];

  getNotifications() {
    FirebaseFirestore.instance
        .collection('Seller')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .collection('Notifications')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print(element.data());
        setState(() {
          list.add(NotificationItem.fromMap(element.data()));
          print('${list.length} list length of notifications');
        });
      });
    });
  }

  deleteNotifications() async {
    var collection = FirebaseFirestore.instance.collection(
        'Seller/${FirebaseAuth.instance.currentUser!.phoneNumber}/Notifications');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  void initState() {
    getNotifications();
    super.initState();
    print('${list.length} Notifications Lengthrr');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: Text(
              'Notifications',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 158.0, top: 10),
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    elevation: 20.0,
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            elevation: 16,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
                              child: Container(
                                height: 200.0,
                                width: 400.0,
                                child: ListView(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Center(
                                      child: Text(
                                        "Are you sure you want to delete all your Notifications?",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 45.0, 30.0, 20.0),
                                      child: ElevatedButton(
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        onPressed: () {
                                          deleteNotifications();
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0)),
                                          elevation: 20.0,
                                          primary: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(
                    'Clear Notifications',
                    style: TextStyle(
                        fontSize: 17.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 600,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        notify: list[index],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
