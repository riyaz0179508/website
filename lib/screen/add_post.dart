
import 'dart:io';
import 'dart:ui';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:beca_kena/model_provider_repo/model/user_model.dart';
import 'package:beca_kena/screen/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}



List<String> categorytList=[
  "Freelancer",
  "Essential",
  "Vehicles",
  "Education",
  "Electrical",
  "Real estate",
  "Services",
  "Community",
  "Personals",
  "Job",
  "Dress",
];
String ? initValDept;
final _auth= FirebaseAuth.instance;
final GlobalKey<FormState> _formKey =GlobalKey();

TextEditingController _locationController=TextEditingController();
TextEditingController _sellertNameController=TextEditingController();
TextEditingController _addressController=TextEditingController();
TextEditingController _phoneNumberController=TextEditingController();
TextEditingController _ponnoController=TextEditingController();
TextEditingController _conditionController=TextEditingController();
TextEditingController _priceController=TextEditingController();
TextEditingController _descriptionController=TextEditingController();
TextEditingController _categoryController=TextEditingController();

File? image3;

class _AddPostState extends State<AddPost> {



  Future pickImageFromGallery( source) async{
    final image4= await ImagePicker().pickImage(
        source: source);
    if(image4==null) return;
    final tempImage= File(image4.path);
    setState(() {
      image3= tempImage;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e9eb),
      appBar:
      AppBar(
        toolbarHeight: 50,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 20),
            child:
            InkWell( onTap: (){

            },
                child: Icon(Icons.search)),
          ),
          SizedBox(width: 5),
          Padding(
            padding:  EdgeInsets.only(right: 20),
            child:
            InkWell( onTap: (){

            },
                child: Icon(Icons.menu)),
          ),

        ],
        backgroundColor: Color(0xff080808),
        title: Text("বেচা-কেনা"),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SingleChildScrollView(
          child:
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    alert(

                      context,
                      //  title: Text('Alert'),
                      content: Text('Choose from',style: TextStyle(fontSize: 20),
                      ),
                      textOK: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: (){
                                  pickImageFromGallery(ImageSource.camera);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Camera',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold
                                  ),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap:(){
                                  pickImageFromGallery(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                                child: Text('File or Gallery',
                                  style: TextStyle(
                                      fontSize: 19,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold
                                  ),)),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      height: 200,
                      width: double.infinity,

                      child: image3!= null?
                    Image.file(image3!,
                      fit: BoxFit.fitHeight,):
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.photo_camera,
                        size: 22, color: Colors.blueGrey,),
                      SizedBox(width: 10,),
                      Text("ছবি যোগ করুন",style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold
                      ), )
                    ],
                    ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20 ),
                  child:
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                              border: Border.all(
                                width: 0.5,
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:
                          TextFormField(
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Field is Empty";
                              }
                            },
                            controller: _categoryController,
                            cursorColor: Colors.grey,

                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(9)
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(8)

                                ),
                                prefixIcon:
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10, left: 15,),
                                  child: DropdownButton(
                                    alignment: Alignment.topLeft,
                                    iconSize: 30,
                                    // iconDisabledColor: Colors.grey,
                                    // iconEnabledColor: Colors.grey,
                                    hint: Text("ক্যাটাগরি"),
                                    items: categorytList.map(
                                            (val) => DropdownMenuItem(
                                            value: val,
                                            child: Text(val,
                                            )
                                        )
                                    ).toList(),

                                    onChanged: (newVal){
                                      setState(() {
                                        initValDept=newVal.toString();
                                      });
                                    },
                                    value: initValDept,
                                  ),
                                ),
                            ),
                          ),

                        ),
                      ),

                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.5,),
                          borderRadius: BorderRadius.circular(10)
                        ),

                        height: 40,
                        width: 190,
                        child:
                        TextFormField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Field is Empty";
                            }
                          },
                          controller: _locationController,
                          cursorColor: Colors.grey,

                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),
                                  borderRadius: BorderRadius.circular(9)
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                       color: Colors.grey
                                  ),
                                borderRadius: BorderRadius.circular(8)

                              ),
                           hintText: "লোকেশন দিন"
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Divider(color: Colors.grey,),
                SizedBox(height: 20,),

                Text("Enter your name", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff1c2841)),),

                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey,width: 0.5),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  width: 380,

                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field is Empty";
                      }
                    },
                    controller: _sellertNameController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(9)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(8)

                        ),
                        hintText: "আপনার নাম লিখুন"
                    ),
                  ),

                ),
                SizedBox(height: 10,),

                SizedBox(height: 10,),
                Text("Enter your address", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1c2841)),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.05),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  width: 380,

                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field is Empty";
                      }
                    },
                    controller: _addressController,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(9)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(8)

                        ),
                        hintText: "আপনার ঠিকানা লিখুন"
                    ),
                  ),

                ),

                SizedBox(height: 20,),
                Divider(color: Colors.grey,),

                SizedBox(height: 20,),
                Text("Mobile Phone", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1c2841)),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.05),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  width: 380,

                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field is Empty";
                      }
                    },
                    controller: _phoneNumberController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(9)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(8)

                        ),
                        hintText: "মোবাইল নং"
                    ),
                  ),

                ),


                SizedBox(height: 20,),
                Divider(color: Colors.grey,),

                SizedBox(height: 20,),
                Text("Name of profuct", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1c2841)),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.05),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  width: 380,

                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field is Empty";
                      }
                    },
                    controller: _ponnoController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(9)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(8)

                        ),
                        hintText: "পন্যের নাম"
                    ),
                  ),

                ),

                SizedBox(height: 20,),
                Text("Condition", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1c2841)),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.05),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  width: 380,

                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field is Empty";
                      }
                    },
                    controller: _conditionController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(9)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(8)

                        ),
                        hintText: "নতুন/পুরাতন"
                    ),
                  ),

                ),



                SizedBox(height: 20,),
                Text("Price", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1c2841)),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.05),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  width: 380,

                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field is Empty";
                      }
                    },
                    controller: _priceController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(9)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(8)

                        ),
                        hintText: "টাকার পরিমাণ"
                    ),
                  ),

                ),

                SizedBox(height: 20,),
                Text("Description", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1c2841)),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.05),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: 380,

                  child:
                  TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field is Empty";
                      }
                    },
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,

                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(9)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(8)

                        ),
                        hintText: "পন্য সম্পর্কে বিস্তারিত লিখুন"
                    ),
                  ),

                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 25),
                  child: Row(
                    children: [
                      ElevatedButton(

                          onPressed: (){

                            Navigator.pop(context);
                          },
                          child: Text(" বাতিল")
                      ),

                      Spacer(),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green
                        ),
                          onPressed: (){
                            Submit;
                          },
                          child: Text("সাবমিট পোষ্ট")
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 50,),

              ],
            ),
          ),
        ),
      ),

    );
  }
}


void Submit(String email, String password,
    context,_formKey)async{
  if(_formKey.currentState!.validate() && image3!=null){
    await _auth.createUserWithEmailAndPassword
      (email: email, password: password)
        .then((value) => {
      productDetails(),
      saveImage(),
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context)=>HomePage()))
    }).catchError((e){
      Fluttertoast.showToast(msg:e.message);

    });
  }else{
    Fluttertoast.showToast(msg: "Image can not be null");
  }

}


void saveImage()async{
  User? _product= FirebaseAuth.instance.currentUser;
  if(image3==null)
    return;
  final destination= _product!.uid.toString();
  final ref= FirebaseStorage.instance
      .ref(destination);
  ref.putFile(image3!);
}


void productDetails() async{
  FirebaseFirestore firestore124=
      FirebaseFirestore.instance;
  User? product= _auth.currentUser;

  UserModel userModel=UserModel();
  userModel.uid=product!.uid;
  userModel.sellerLocation= _locationController.text;
  userModel.sellerName= _sellertNameController.text;
  userModel.sellerAddress= _addressController.text;
  userModel.sellerPhone= _phoneNumberController.text;
  userModel.sellerPonno= _ponnoController.text;
  userModel.sellerCondition= _conditionController.text;
  userModel.sellerPrice= _priceController.text;
  userModel.sellerDescription= _descriptionController.text;



  await firestore124.collection("products").
  doc(initValDept)
      .collection('Product')
      .doc(product.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Post Saved Successfully");
}