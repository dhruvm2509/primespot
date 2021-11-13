import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Screens/firstpage.dart';
import 'package:primespot/category/grocery.dart';
import 'package:primespot/category/medicines.dart';
import 'package:primespot/category/mobile_accessories.dart';
import 'package:primespot/category/stationary.dart';

class BuyerDashboard extends StatefulWidget {
  String? documentId;
  BuyerDashboard(this.documentId);
  // const BuyerDashboard({Key? key}) : super(key: key);

  @override
  _BuyerDashboardState createState() => _BuyerDashboardState(documentId);
}

class _BuyerDashboardState extends State<BuyerDashboard> {
  String? documentId;
  _BuyerDashboardState(this.documentId);
  List<String> uid = [];
  String? buyerName;

  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('Buyer')
        .doc(documentId)
        .get()
        .then((value) {
      buyerName = value['Name'];
    });

    fetchSellerId();
  }

  Future fetchSellerId() async {
    FirebaseFirestore.instance
        .collection('Buyer')
        .doc(documentId)
        .get()
        .then((value) {
      buyerName = value['Name'];
    });

    String? buyerPinCode;

    await FirebaseFirestore.instance
        .collection('Buyer')
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .get()
        .then((value) {
      buyerPinCode = value['PinCode'];
      print('buyer Pincode = $buyerPinCode');
    });

    final snapshot =
        await FirebaseFirestore.instance.collection('Seller').get();
    snapshot.docs.forEach((doc) {
      if (doc.data()['PinCode'] == buyerPinCode) {
        uid.add(doc.data()['mobileNumber']);

        print('${doc.data()} Seller with same pin code');
      }

      //print(doc.data()['mobileNumber']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,

        title: Center(
            child: buyerName == null
                ? Text('Buyer\'s Dashboard')
                : Text('$buyerName')),
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
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 6.0,
              ),
              Card(
                elevation: 18.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mobile(uid: uid)));
                  },
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(color: Colors.limeAccent, width: 5.0),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/03/64/41/07/360_F_364410725_IFLJi9mHRoeZ8W2bcGX1sxVJka14RmwZ.jpg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Card(
                elevation: 18.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Grocery(uid: uid)));
                  },
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(color: Colors.limeAccent, width: 5.0),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://res.cloudinary.com/culturemap-com/image/upload/ar_4:3,c_fill,g_faces:center,w_980/v1622057735/photos/277221_original.jpg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(
                'Mobile Accessories',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0),
              ),
              SizedBox(
                width: 70.0,
              ),
              Text(
                'Grocery',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 6.0,
              ),
              Card(
                elevation: 18.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Stationary(uid: uid)));
                  },
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(color: Colors.limeAccent, width: 5.0),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://d1amk1w0mr5k0.cloudfront.net/blog/wp-content/uploads/2018/08/GettyImages-802465010-1.jpg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Card(
                elevation: 18.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Medicines(uid: uid)));
                  },
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(color: Colors.limeAccent, width: 5.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://static.toiimg.com/thumb/msid-81532660/81532660.jpg?width=500&resizemode=4'),
                            fit: BoxFit.fitHeight)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.0,
              ),
              Text(
                'Stationary',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0),
              ),
              SizedBox(
                width: 100.0,
              ),
              Text(
                'Medicines',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
