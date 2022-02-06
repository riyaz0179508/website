
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screen/home_page.dart';
import 'screen/login_page.dart';



Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    Fluttertoast.showToast(msg: "Connected with Mobile");
  } else if (connectivityResult == ConnectivityResult.wifi) {
    Fluttertoast.showToast(msg: "Connected with Wifi");
  } else {
    Fluttertoast.showToast(msg: "No internet Connection");
  }

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization  = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      FirebaseAuth.instance.currentUser==null?
      LoginPage():
      HomePage(),
    );
  }
}
