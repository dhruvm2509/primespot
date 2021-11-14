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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Notifications'),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 158.0, top: 10),
            child: Container(
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                              child: Container(
                                height: 200.0,
                                width: 380.0,
                                child: ListView(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Center(
                                      child: Text(
                                        "Are you sure you want to delete all your Notifications?",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 25.0, 30.0, 20.0),
                                        child: ElevatedButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            deleteNotifications();
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.green[600],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text('Clear Notifications')),
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
    );
  }
}
