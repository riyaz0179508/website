
import 'package:beca_kena/screen/home_page.dart';
import 'package:beca_kena/screen/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
