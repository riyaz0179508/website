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

String pass="";

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          validator: (value){
            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value!);
            if(value == null || value.isEmpty){
              return "Field is Empty";
            }
            if(widget.hintText=="Enter your Email"){
              if(!emailValid){
                return "Invalid email format";
              }
              if(widget.hintText=="Enter Password"){
                pass= value;
                if(value.length<6){
                  return "Password must be atlast 6 Character";
                }
              }

              if(widget.hintText=="Enter Password" || widget.hintText=="Conform Password"){
                if(value.length>8){
                  return "Password must be highest 8 Character";
                }
              }

              if(widget.hintText=="Conform Password"){
                if(pass != value){
                  return "Password didn't match";
                }
              }

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
