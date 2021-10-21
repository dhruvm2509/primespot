import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:primespot/Screens/buyer.dart';
import 'package:primespot/Screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:primespot/Screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefss = await SharedPreferences.getInstance();
  final isLoggedIn = (prefss.getBool('isLoggedIn') == null)
      ? false
      : prefss.getBool('isLoggedIn');

  SharedPreferences pref = await SharedPreferences.getInstance();
  var seller = (pref.getBool('sellerrole') ?? false);

  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PrimeSpot',
      // routes: {
      //   '/': (context) => SplashScreen(),
      // },
      home: isLoggedIn == null
          ? (seller ? HomeScreen() : BuyerScreen())
          : SplashScreen()));
}
