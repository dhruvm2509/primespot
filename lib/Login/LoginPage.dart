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
                  child: Image(
                    image: AssetImage('assets/Capture-modified.png'),
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
                  height: 80,
                  width: 250,
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.amber,
                        hintText: "Enter Mobile Number",
                        labelText: "Mobile Number",
                        prefixIcon: Icon(Icons.phone),
                        contentPadding:
                            EdgeInsets.fromLTRB(00.0, 0.0, 20.0, 0.0),
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
                  width: 120,
                  child: RoundedLoadingButton(
                    controller: _btnController1,
                    onPressed: () {
                      _doSomething(_btnController1);
                    },
                    child: Text('Send OTP'),
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
