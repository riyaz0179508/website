import 'package:beca_kena/helper/custom_button.dart';
import 'package:beca_kena/helper/custom_text_form_field.dart';
import 'package:beca_kena/screen/Sign_up_page.dart';
import 'package:beca_kena/screen/home_page.dart';
import 'package:beca_kena/helper/color.dart';
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
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Welcome back !", style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),

                height: screenHeight,
                width: double.infinity,
                child: Column(
                  children: [
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: CustomButton(
                        height: 50,
                        width: 350,
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


            ],
          ),
        ),
      ),
    );
  }
}


