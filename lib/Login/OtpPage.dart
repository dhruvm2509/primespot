import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:primespot/Home/home_buyer.dart';
import 'package:primespot/Home/home_seller.dart';
import 'package:primespot/Registration/BuyerRegistration.dart';
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeSeller()),
                (route) => false);
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SellerRegistration()),
                (route) => false);
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeBuyer()),
                (route) => false);
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BuyerRegistration()),
                (route) => false);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Text(
              'OTP Verification',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25.0,
                  letterSpacing: 2.0),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 320.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          width: 2.5,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.freepik.com/free-vector/password-code-verification-security-protection-authorization-notice-mobile-phone-digital-secure-access-pus-notification-message-cellphone-vector-flat_212005-111.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 233.0, left: 50.0),
                    child: Container(
                      height: 35.0,
                      width: 290.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: Text(
                          'Verify +91- ${widget.phone}',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  // padding: const EdgeInsets.all(20.0),
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
                                verificationId: _verificationCode,
                                smsCode: pin))
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
