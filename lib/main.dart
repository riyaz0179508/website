
import 'package:beca_kena/screen/home_page.dart';
import 'package:beca_kena/screen/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization  = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()

      // HomePage(
      //   img: "",
      //   ponnoController: "",
      //   conditionController: "",
      //   priceController: "",
      //
      // ),
    );
  }
}
