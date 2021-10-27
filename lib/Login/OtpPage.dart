import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:primespot/Dashboard/BuyerDashboard.dart';
import 'package:primespot/Dashboard/SellerDashboard.dart';
import 'package:primespot/Registration/BuyerRegistration.dart';
import 'package:primespot/Screens/home.dart';
import 'package:primespot/Registration/SellerRegistration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool seller = false;

class OTPScreen extends StatefulWidget {
  final String? phone;
  OTPScreen(this.phone);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool codeSent = false;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String _verificationCode = '';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('Credentials');
          print(credential);
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print('--------------------------User logged In Successfully');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int? resendToken) async {
          setState(() {
            _verificationCode = verificationID;
            codeSent = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  Future<void> checkRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    seller = (pref.getBool('sellerrole') ?? false);
    print(seller);
  }

  @override
  void initState() {
    super.initState();
    checkRole();
    _verifyPhone();
  }

  _phoneVerified() async {
    if (seller) {
      await FirebaseFirestore.instance
          .collection("Seller")
          .doc('+91' + widget.phone!)
          .get()
          .then(
        (value) {
          if (value.exists) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SellerDashboard()),
            );
          } else {
            FirebaseFirestore.instance
                .collection("Seller")
                .doc(
                  '+91' + widget.phone!,
                )
                .set(
              {
                'Name': 'Name',
                'mobileNumber': '+91' + widget.phone!,
              },
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SellerRegistration()),
            );
          }
        },
      );
    } else {
      await FirebaseFirestore.instance
          .collection("Buyer")
          .doc('+91' + widget.phone!)
          .get()
          .then(
        (value) {
          if (value.exists) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuyerDashboard()),
            );
          } else {
            FirebaseFirestore.instance
                .collection("Buyer")
                .doc(
                  '+91' + widget.phone!,
                )
                .set(
              {
                'Name': 'Name',
                'mobileNumber': '+91' + widget.phone!,
              },
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuyerRegistration()),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Text('OTP Verification')),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +91- ${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              child: PinPut(
                fieldsCount: 6,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        _phoneVerified();
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                  }
                },
                selectedFieldDecoration: _pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.deepPurpleAccent.withOpacity(.5),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
