import 'package:beca_kena/helper/custom_widget/custom_button.dart';
import 'package:beca_kena/helper/custom_widget/custom_text_form_field.dart';
import 'package:beca_kena/screen/Sign_up_page.dart';
import 'package:beca_kena/screen/my_home_page.dart';
import 'package:beca_kena/utils/all_color/color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
final GlobalKey<FormState> _formKey =GlobalKey();
TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
AllColor allColor=AllColor();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
               if(_formKey.currentState!.validate());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
              },
              child: CustomButton(
                height: 50,
                width: 300,
                btnText: "Log in",
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ", style: TextStyle(fontSize: 18),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  },
                    child: Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.blue),)),
              ],
            )

          ],
        ),
      ),
    );
  }
}


