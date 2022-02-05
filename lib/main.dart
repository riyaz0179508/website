
import 'package:beca_kena/screen/login_page.dart';
import 'package:beca_kena/screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      HomePage(
        img: "",
        ponnoController: "",
        conditionController: "",
        priceController: "",

      ),
    );
  }
}
