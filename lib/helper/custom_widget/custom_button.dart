import 'package:beca_kena/helper/login_page/login_page.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  double height;
  double width;
  String btnText;

   CustomButton({Key? key,
    required this.height,
    required this.width,
    required this.btnText,

  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Center(
          child: Text(widget.btnText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold

          ),)),
      color: allColor.CustomButtonColor,
    );
  }
}
