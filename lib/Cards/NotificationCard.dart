import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Models/NotificationItem.dart';
import 'package:primespot/Models/ProductItem.dart';

class NotificationCard extends StatefulWidget {
  final NotificationItem notify;
  const NotificationCard({Key? key, required this.notify}) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  String buyerName = "";
  String buyerAddress = "";
  String image =
      'https://www.mytrendyphone.eu/images/Haylou-LS02-Waterproof-Smartwatch-with-Heart-Rate-Black-6971664930443-11092020-01-p.jpg';

  void initState() {
    FirebaseFirestore.instance
        .collection('Buyer')
        .doc('${widget.notify.buyerId}')
        .get()
        .then((value) => buyerAddress = value['Address']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          height: 350.0,
                          width: 400.0,
                          child: ListView(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Center(
                                child: Text(
                                  "Buyer Details",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                                child: Text(
                                  'Buyer Name:',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 40),
                                  child: Text(
                                    widget.notify.buyerName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  )),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                                child: Text(
                                  'Mobile Number',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 40),
                                child: Text(
                                  '${widget.notify.mobileNumber}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(30.5, 20.0, 30.0, 0.0),
                                child: Text(
                                  'Buyer Address',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 40),
                                  child: Text(
                                    buyerAddress,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      30.0, 25.0, 30.0, 20.0),
                                  child: ElevatedButton(
                                    child: Text('Okay'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green[600],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Card(
                color: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //       image: DecorationImage(
                    //         image: NetworkImage(widget.notify.imageUrl == ""
                    //             ? image
                    //             : widget.notify.imageUrl),
                    //       )),
                    //   height: 150.0,
                    //   width: 140.0,
                    // ),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 5.0,
                        // ),

                        SizedBox(
                          height: 5.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, left: 10.0, bottom: 5.0),
                          child: Container(
                            height: 40.0,
                            width: 300.0,
                            child: Text(
                              widget.notify.message,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  letterSpacing: 1.5,
                                  color: Colors.green),
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 25,
                        //   width: 250,

                        //   child: FittedBox(
                        //       fit: BoxFit.fitWidth,
                        //       child: Text(widget.notify.message),),
                        // ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width,
                        //   child: FittedBox(
                        //     fit: BoxFit.contain,
                        //     child: Text(
                        //       widget.notify.message,
                        //       textAlign: TextAlign.justify,
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.w600,
                        //           fontStyle: FontStyle.normal),
                        //     ),
                        //   ),
                        // ),

                        // Container(
                        //   height: 50,
                        //   child: Text(
                        //     ' ${widget.notify.message}/-',
                        //     style: TextStyle(
                        //         fontSize: 15.0,
                        //         letterSpacing: 1.0,
                        //         fontWeight: FontWeight.w700),
                        //   ),
                        // ),
                      ],
                    ))
                  ],
                ),
                shadowColor: Colors.grey,
                elevation: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
