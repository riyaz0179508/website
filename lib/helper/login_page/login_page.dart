import 'package:beca_kena/helper/custom_widget/custom_text_form_field.dart';
import 'package:beca_kena/utils/all_color/color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
AllColor allColor=AllColor();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Icon(Icons.star, color: allColor.iconColor,),
          SizedBox(height: 50,),
          CustomTextField(
            emailController: _emailController,
            labelText: "Email",
          ),

          SizedBox(height: 20,),
          CustomTextField(
            emailController: _passController,
            labelText: "Password",
          ),

        ],
      ),
    );
  }
}


