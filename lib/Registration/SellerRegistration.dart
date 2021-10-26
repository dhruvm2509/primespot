import 'package:flutter/material.dart';

import 'package:primespot/Screens/firstpage.dart';

class SellerRegistration extends StatefulWidget {
  const SellerRegistration({Key? key}) : super(key: key);

  @override
  _SellerRegistrationState createState() => _SellerRegistrationState();
}

class _SellerRegistrationState extends State<SellerRegistration> {
  Color _iconColor1 = Colors.white;
  Color _iconColor2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Text(
                'Register',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Colors.black),
        body: Container(
          height: 670.0,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        cursorColor: Colors.amber,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 3.5),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        cursorColor: Colors.amber,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
                        decoration: InputDecoration(
                          hintText: "Shop Name",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.shop_outlined,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 3.5),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        cursorColor: Colors.amber,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
                        decoration: InputDecoration(
                          hintText: "Shop Address",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 3.5),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        cursorColor: Colors.amber,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
                        decoration: InputDecoration(
                          hintText: "Contact Number",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.phone_android_outlined,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 3.5),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        cursorColor: Colors.amber,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 20.0),
                        decoration: InputDecoration(
                          hintText: "City",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.location_city_outlined,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 3.5),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        cursorColor: Colors.amber,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
                        decoration: InputDecoration(
                          hintText: "City Pincode",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.pin_outlined,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 3.5),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 55.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 3.5,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Icon(
                          Icons.delivery_dining_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          'Home Delivery',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _iconColor1 = Colors.green;
                                _iconColor2 = Colors.white;
                              });
                            },
                            icon: Icon(
                              Icons.check_box,
                              color: _iconColor1,
                              size: 28.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _iconColor2 = Colors.red;
                                _iconColor1 = Colors.white;
                              });
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: _iconColor2,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: ElevatedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.amber.shade600,
                          width: 3.0,
                        ),
                        primary: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
