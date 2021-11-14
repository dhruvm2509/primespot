import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuyerProfile extends StatefulWidget {
  String? documentId;

  BuyerProfile(this.documentId);
  @override
  MapScreenState createState() => MapScreenState(documentId);
}

class MapScreenState extends State<BuyerProfile>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  @override
  String? oldName;
  String? oldAddress;
  String? oldMobileNumber;
  String? oldCity;
  String? oldPinCode;

  String? newName;
  String? newAddress;
  String? newMobileNumber;
  String? newCity;
  String? newPinCode;
  String? documentId;

  MapScreenState(this.documentId);

  void initState() {
    print(documentId);
    super.initState();
    FirebaseFirestore.instance
        .collection("Buyer")
        .doc(documentId)
        .get()
        .then((value) {
      // print(value['aadharNumber']);
      oldName = value['Name'];
      oldAddress = value['Address'];
      oldMobileNumber = value['mobileNumber'];
      oldCity = value['City'];
      oldPinCode = value['PinCode'];

      print(oldName);
      print(oldAddress);
      print(oldMobileNumber);

      _controller.text = oldName.toString();
      _controller1.text = oldAddress.toString();
      _controller2.text = oldMobileNumber.toString();
      _controller3.text = oldCity.toString();
      _controller4.text = oldPinCode.toString();
    });
    _controller = new TextEditingController(text: oldName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 250.0,
                color: Colors.white,
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 22.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 65.0),
                            child: Text(' BUYER\'S PROFILE ',
                                style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.0,
                                    fontFamily: 'sans-serif-light',
                                    color: Colors.black)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage('assets/as.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      )),
                ]),
              )
            ],
          ),
          Container(
            color: Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Personal Information',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              _status ? _getEditIcon() : Container(),
                            ],
                          )
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                                fontStyle: FontStyle.italic,
                              ),
                              controller: _controller,
                              // ..text = oldFullName;
                              decoration: const InputDecoration(
                                  // hintText: "Enter Your Name",
                                  ),
                              onChanged: (value) {
                                setState(() {
                                  newName = value;
                                });
                              },
                              enabled: !_status,
                              autofocus: !_status,
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Address',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2.0,
                                  fontStyle: FontStyle.italic,
                                ),
                                controller: _controller1,
                                decoration: const InputDecoration(
                                    hintText: "Enter Address"),
                                enabled: !_status,
                                onChanged: (value) {
                                  setState(() {
                                    newAddress = value;
                                  });
                                }),
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'City',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2.0,
                                  fontStyle: FontStyle.italic,
                                ),
                                controller: _controller3,
                                decoration: const InputDecoration(
                                    hintText: "Enter City"),
                                enabled: !_status,
                                onChanged: (value) {
                                  setState(() {
                                    newCity = value;
                                  });
                                }),
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'PinCode',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2.0,
                                  fontStyle: FontStyle.italic,
                                ),
                                controller: _controller4,
                                decoration: const InputDecoration(
                                    hintText: "Enter PinCode"),
                                enabled: !_status,
                                onChanged: (value) {
                                  setState(() {
                                    newPinCode = value;
                                  });
                                }),
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Mobile Number',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2.0,
                                  fontStyle: FontStyle.italic,
                                ),
                                controller: _controller2,
                                decoration: const InputDecoration(
                                    hintText: "Enter Mobile Number"),
                                enabled: !_status,
                                onChanged: (value) {
                                  setState(() {
                                    newMobileNumber = value;
                                  });
                                }),
                          ),
                        ],
                      )),
                  !_status ? _getActionButtons() : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    newMobileNumber == null
                        ? newMobileNumber = oldMobileNumber
                        : newMobileNumber = newMobileNumber;

                    newName == null ? newName = oldName : newName = newName;

                    newPinCode == null
                        ? newPinCode = oldPinCode
                        : newPinCode = newPinCode;

                    newAddress == null
                        ? newAddress = oldAddress
                        : newAddress = newAddress;

                    newCity == null ? newCity = oldCity : newCity = newCity;

                    if (newName != null &&
                        newAddress != null &&
                        newCity != null &&
                        newPinCode != null &&
                        newMobileNumber != null) {
                      print("checking");
                      // var firebaseUser = FirebaseAuth.instance.currentUser;
                      FirebaseFirestore.instance
                          .collection("Buyer")
                          .doc(documentId)
                          .update({
                        "Address": newAddress,
                        "Name": newName,
                        "mobileNumber": newMobileNumber,
                        "City": newCity,
                        "PinCode": newPinCode
                      }).then((_) {
                        print("success!");
                      }).catchError((err) {
                        print("error");
                      });
                    }
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
