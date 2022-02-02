import 'package:beca_kena/helper/login_page/login_page.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController emailController;
  String hintText;
  bool obsecureValue;
   CustomTextField({Key? key,

    required this.emailController,
    required this.hintText,
     required this.obsecureValue



  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return "Field is Empty";
            }

          },
          obscureText: widget.obsecureValue,
        controller: widget.emailController,
          decoration: InputDecoration(
            labelText: widget.hintText,
            labelStyle: TextStyle(color: allColor.iconColor),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: allColor.iconColor),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: allColor.iconColor),
              borderRadius: BorderRadius.circular(10),
            )
          ),
    ),
      );
  }
}
