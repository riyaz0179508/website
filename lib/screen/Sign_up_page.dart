import 'package:beca_kena/helper/custom_widget/custom_button.dart';
import 'package:beca_kena/helper/custom_widget/custom_text_form_field.dart';
import 'package:beca_kena/helper/login_page/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

final GlobalKey<FormState> _formKey =GlobalKey();
TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
TextEditingController _conformPassController=TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Icon(Icons.star, color: allColor.iconColor,),
            SizedBox(height: 50,),
            CustomTextField(
              emailController: _emailController,
              hintText: "Enter your Email",
              obsecureValue: false,
            ),

            SizedBox(height: 20,),
            CustomTextField(
              emailController: _passController,
              hintText: "Enter Password",
              obsecureValue: true,

            ),
            CustomTextField(
              emailController: _conformPassController,
              hintText: "Conform Password",
              obsecureValue: true,

            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                if(_formKey.currentState!.validate());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: CustomButton(
                height: 50,
                width: 300,
                btnText: "Sign Up",
              ),
            ),

            SizedBox(height: 20,),



          ],
        ),
      ),
    ),

    );
  }
}
