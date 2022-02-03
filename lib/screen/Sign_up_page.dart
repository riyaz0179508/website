import 'package:beca_kena/helper/custom_widget/custom_button.dart';
import 'package:beca_kena/helper/custom_widget/custom_text_form_field.dart';
import 'package:beca_kena/helper/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}
final _auth= FirebaseAuth.instance;
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
                signUp(_emailController.text,
                    _passController.text, context);
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

void signUp(String email, String password, context )async{
  if(_formKey.currentState!.validate()){
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password).then((value) => {
      Fluttertoast.showToast(msg: "Sign Up Successful"),
    }).catchError((e){
      Fluttertoast.showToast(msg: e.massage);
    });
  }


}