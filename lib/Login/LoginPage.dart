import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'OtpPage.dart';

bool role = false;

class LoginScreen extends StatefulWidget {
  static String? phone;
  final bool isseller;

  LoginScreen({Key? key, required this.isseller}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();
  TextEditingController _controller = TextEditingController();
  void _doSomething(RoundedLoadingButtonController controller) async {
    if (_controller.text.length == 10) {
      Duration(seconds: 5);
      controller.success();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OTPScreen(_controller.text)));
    } else {
      print('Invalid Number');

      controller.reset();
    }
  }

  @override
  void initState() {
    fetchRole();
    super.initState();
  }

  void fetchRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (widget.isseller == true) {
      await pref.setBool('sellerrole', true);
    } else {
      await pref.setBool('sellerrole', false);
    }
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
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.5),
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: AssetImage('assets/Login.jpg'),
                      )),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 10.0, top: 30.0),
                  child: Center(
                    child: Text(
                      'Enter your Valid Mobile No.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 80,
                  width: 250,
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.0),
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(00.0, 0.0, 20.0, 0.0),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.amber, width: 2.5),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 40,
                  width: 140,
                  child: RoundedLoadingButton(
                    color: Colors.amber,
                    controller: _btnController1,
                    onPressed: () {
                      _doSomething(_btnController1);
                    },
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
