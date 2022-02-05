import 'dart:io';

import 'package:alert_dialog/alert_dialog.dart';
import 'package:beca_kena/helper/custom_button.dart';
import 'package:beca_kena/helper/custom_text_form_field.dart';
import 'package:beca_kena/model_provider_repo/model/user_model.dart';
import 'package:beca_kena/screen/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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
TextEditingController _phoneController=TextEditingController();
TextEditingController _nameController=TextEditingController();
File? image;


String ? initValDept;

class _SignUpPageState extends State<SignUpPage> {

  Future pickImageFromGallery( source) async{
    final image2= await ImagePicker().pickImage(
        source: source);
    if(image2==null) return;
    final tempImage= File(image2.path);
    setState(() {
      image= tempImage;
    });
  }
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
              height: 100,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Hello budy !", style: TextStyle(
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


              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [


                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (){
                        alert(
                          context,
                          //  title: Text('Alert'),
                          content: Text('Select One'),
                          textOK: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: (){
                                      pickImageFromGallery(ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Take from Camera',
                                        style: TextStyle(
                                            fontSize: 15
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap:(){
                                      pickImageFromGallery(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Take from Gallery',
                                        style: TextStyle(
                                            fontSize: 15
                                        ),),
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipOval(
                        child:
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.deepOrange
                              ),
                              borderRadius: BorderRadius.circular(180)
                          ),
                          height: 130,
                          width: 130,
                          child: image!= null?
                          Image.file(image!,
                            fit: BoxFit.cover,):
                          Icon(Icons.camera_alt,
                            size: 40,),
                        ),

                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      emailController: _nameController,
                      hintText: "Enter Your Full Name",
                      obsecureValue: false,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      emailController: _phoneController,
                      hintText: "Phone Number",
                      obsecureValue: false,
                    ),

                    SizedBox(
                      height: 20,
                    ),
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
                    CustomTextField(
                      emailController: _conformPassController,
                      hintText: "Conform Password",
                      obsecureValue: true,

                    ),
                    SizedBox(height: 40,),
                    InkWell(
                      onTap: (){
                        signUp(_emailController.text,
                            _passController.text,
                            context,_formKey
                        );
                      },
                      child: CustomButton(
                        height: 50,
                        btnText: "Sign Up",
                        width: 350,
                      ),
                    ),


                  ],
                ),
              ),
            ),





          ],
        ),
      ),
    ),

    );
  }
}

void signUp(String email, String password,
    context,_formKey)async{
  if(_formKey.currentState!.validate() && image!=null){
    await _auth.createUserWithEmailAndPassword
      (email: email, password: password)
        .then((value) => {
      saveUserDetails(),
      saveImage(),
      Fluttertoast.showToast(msg: "SignUp Successful!"),
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context)=>HomePage(
                img: "",
                ponnoController: "",
                conditionController: "",
                priceController: "",

              )))
    }).catchError((e){
      Fluttertoast.showToast(msg:e.message);

    });
  }else{
    Fluttertoast.showToast(msg: "Image can not be null");
  }

}

void saveImage()async{
  User? _user= FirebaseAuth.instance.currentUser;
  if(image==null)
    return;
  final destination= _user!.uid.toString();
  final ref= FirebaseStorage.instance
      .ref(destination);
  ref.putFile(image!);
}
void saveUserDetails() async{
  FirebaseFirestore firestore123=
      FirebaseFirestore.instance;
  User? user= _auth.currentUser;

  UserModel userModel=UserModel();
  userModel.uid=user!.uid;
  userModel.email= _emailController.text;
  userModel.phone= _phoneController.text;
  userModel.name= _nameController.text;
  // userModel.dept= initValDept;


  await firestore123.collection("users").
  doc(initValDept)
      .collection('allStd')
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Data Saved Successfully");
}