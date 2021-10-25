import 'package:flutter/material.dart';
import 'package:primespot/Screens/firstpage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.email_outlined,
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
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Center(
                      child: TextField(
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 1.5),
                        cursorColor: Colors.amber,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.password_outlined,
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
                        keyboardType: TextInputType.visiblePassword,
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
