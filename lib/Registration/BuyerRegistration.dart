import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Dashboard/BuyerDashboard.dart';

class BuyerRegistration extends StatefulWidget {
  const BuyerRegistration({Key? key}) : super(key: key);

  @override
  _BuyerRegistrationState createState() => _BuyerRegistrationState();
}

class _BuyerRegistrationState extends State<BuyerRegistration> {
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _pincode = TextEditingController();
  final _mobile = TextEditingController();

  void saveData() async {
    await FirebaseFirestore.instance
        .collection("Buyer")
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .update({
      "Name": _name.text,
      "Address": _address.text,
      "City": _city.text,
      "PinCode": _pincode.text,
      "Mobile": _mobile.text,
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BuyerDashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Text(
                'BuyerRegistration',
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
          height: 700.0,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        controller: _name,
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
                        controller: _mobile,
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
                        controller: _address,
                        cursorColor: Colors.amber,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
                        decoration: InputDecoration(
                          hintText: "Address",
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
                        controller: _city,
                        cursorColor: Colors.amber,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
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
                        controller: _pincode,
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => FirstPage()));
                        print(_name.text);
                        print(_city.text);
                        print(_address.text);
                        print(_pincode.text);
                        print(_mobile.text);
                        saveData();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
// =======
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'firstpage.dart';

// class BuyerScreen extends StatefulWidget {
//   const BuyerScreen({Key? key}) : super(key: key);

//   @override
//   _BuyerScreenState createState() => _BuyerScreenState();
// }

// class _BuyerScreenState extends State<BuyerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text('Buyer Page'),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (context) => FirstPage()),
//                     (route) => false);
//               },
//               icon: Icon(Icons.logout))
//         ],
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           Container(
//             child: Text('Welcome to Buyer\'s page!!'),
//           )
//         ],
//       )),
// >>>>>>> main
    );
  }
}
