import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

bool role = false;

class LoginScreen extends StatefulWidget {
  static String? phone;
  // final bool isowner;

  LoginScreen({Key? key}) : super(key: key);
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();
  void _doSomething(RoundedLoadingButtonController controller) async {
    Duration(seconds: 5);

    controller.success();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Container(
                  child: Image.asset(
                    "logo.PNG",
                    width: 200,
                    height: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Text(
                      'Enter your Valid Mobile No',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 250,
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.amber,
                        hintText: "Enter Mobile Number",
                        labelText: "Mobile Number",
                        prefixIcon: Icon(Icons.phone),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.indigo, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: RoundedLoadingButton(
                    controller: _btnController1,
                    onPressed: () {
                      _doSomething(_btnController1);
                    },
                    child: Text('Send OTP'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
