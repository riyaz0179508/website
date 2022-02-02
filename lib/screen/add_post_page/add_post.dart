
import 'dart:io';
import 'dart:ui';

import 'package:alert_dialog/alert_dialog.dart';
import 'package:beca_kena/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}



List<String> deptList=[
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


TextEditingController _locationController=TextEditingController();
TextEditingController _nameController=TextEditingController();
TextEditingController _addressController=TextEditingController();
TextEditingController _phoneNumberController=TextEditingController();
TextEditingController _ponnoController=TextEditingController();
TextEditingController _conditionController=TextEditingController();
TextEditingController _priceController=TextEditingController();
TextEditingController _descriptionController=TextEditingController();


class _AddPostState extends State<AddPost> {

  final _formKey=GlobalKey<FormState>();

  File? image;
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

                      child: image!= null?
                    Image.file(image!,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: DropdownButton(
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.black,
                              iconSize: 30,
                              hint:
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("Categories",
                                  style: TextStyle(color: Colors.black,),),
                              ),
                              items: deptList.map(
                                      (val) => DropdownMenuItem(
                                      value: val,
                                      child: Text(val,
                                        style: TextStyle(color: Colors.black),
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
                    controller: _nameController,
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

                          },
                          child: Text(" বাতিল")
                      ),

                      Spacer(),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green
                        ),
                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              HomePage(
                                img: image!.path,
                                ponnoController: _ponnoController.text,
                                conditionController: _conditionController.text,
                                priceController: _priceController.text,
                              )));
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
