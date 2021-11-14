import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProduct extends StatefulWidget {
  String? documentId;

  EditProduct(this.documentId);
  @override
  MapScreenState createState() => MapScreenState(documentId);
}

class MapScreenState extends State<EditProduct>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  @override
  String? oldProductName;
  String? oldProductDescription;
  String? oldimageUrl;
  String? oldPrice;
  String? oldCategory;

  String? newProductName;
  String? newProductDescription;
  String? newimageUrl;
  String? newPrice;
  String? newCategory;

  String? documentId;

  List<String> Category = [
    'Mobile Accessories',
    'Groceries',
    'Stationaries',
    'Medicines'
  ];

  MapScreenState(this.documentId);

  void initState() {
    print(documentId);
    super.initState();

    FirebaseFirestore.instance
        .collection(
            'Seller/${FirebaseAuth.instance.currentUser!.phoneNumber}/Products')
        .doc(documentId)
        .get()
        .then((value) {
      // print(value['aadharNumber']);
      oldProductName = value['ProductName'];
      oldProductDescription = value['ProductDescription'];
      oldimageUrl = value['imageUrl'];
      oldPrice = value['Price'];
      oldCategory = value['Category'];

      print(oldProductDescription);
      print(oldProductName);

      _controller.text = oldProductName.toString();
      _controller1.text = oldProductDescription.toString();
      _controller2.text = oldimageUrl.toString();
      _controller3.text = oldPrice.toString();
      _controller4.text = oldCategory.toString();
    });
    _controller = new TextEditingController(text: oldProductName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Edit Product',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w900,
                  fontSize: 25.0),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Edit Your Product',
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
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
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 45.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Product Name',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        controller: _controller,
                                        // ..text = oldFullName;
                                        decoration: const InputDecoration(
                                            // hintText: "Enter Your Name",
                                            ),
                                        onChanged: (value) {
                                          setState(() {
                                            newProductName = value;
                                          });
                                        },
                                        enabled: !_status,
                                        autofocus: !_status,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Product Description',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        controller: _controller1,
                                        // ..text = oldFullName;
                                        decoration: const InputDecoration(
                                            // hintText: "Enter Your Name",
                                            ),
                                        onChanged: (value) {
                                          setState(() {
                                            newProductDescription = value;
                                          });
                                        },
                                        enabled: !_status,
                                        autofocus: !_status,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Price',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                          controller: _controller3,
                                          decoration: const InputDecoration(
                                              hintText: "Enter Price"),
                                          enabled: !_status,
                                          onChanged: (value) {
                                            setState(() {
                                              newPrice = value;
                                            });
                                          }),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Category',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: DropdownButtonFormField<String>(
                                hint: Text('Select Category'),
                                value: oldCategory,
                                isDense: true,
                                icon: const Icon(Icons.arrow_downward),
                                onChanged: (newValue) {
                                  setState(() {
                                    newCategory = newValue;
                                  });
                                  print(newCategory);
                                },
                                items: Category.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Image Url',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                          controller: _controller2,
                                          decoration: const InputDecoration(
                                              hintText: "Enter Image Url"),
                                          enabled: !_status,
                                          onChanged: (value) {
                                            setState(() {
                                              newimageUrl = value;
                                            });
                                          }),
                                    ),
                                  ],
                                )),
                            !_status ? _getActionButtons() : Container(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
                    newProductName == null
                        ? newProductName = oldProductName
                        : newProductName = newProductName;

                    newProductDescription == null
                        ? newProductDescription = oldProductDescription
                        : newProductDescription = newProductDescription;

                    newimageUrl == null
                        ? newimageUrl = oldimageUrl
                        : newimageUrl = newimageUrl;

                    newPrice == null
                        ? newPrice = oldPrice
                        : newPrice = newPrice;

                    newCategory == null
                        ? newCategory = oldCategory
                        : newCategory = newCategory;

                    if (newProductName != null &&
                        newProductDescription != null &&
                        newPrice != null &&
                        newCategory != null &&
                        newimageUrl != null) {
                      // print("checking");
                      // var firebaseUser = FirebaseAuth.instance.currentUser;
                      FirebaseFirestore.instance
                          .collection(
                              'Seller/${FirebaseAuth.instance.currentUser!.phoneNumber}/Products')
                          .doc(documentId)
                          .update({
                        "ProductName": newProductName,
                        "ProductDescription": newProductDescription,
                        "imageUrl": newimageUrl,
                        "Price": newPrice,
                        "Category": newCategory,
                      }).then((_) {
                        print("success! Product Edited Successfully");
                      }).catchError((err) {
                        print("error in editing product");
                      });
                    }
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.pop(context);
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
          print("Edit Your Product++++++++++++++++++++++++++++++++");
          _status = false;
        });
      },
    );
  }
}
