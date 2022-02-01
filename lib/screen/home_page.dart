

import 'dart:io';

import 'package:beca_kena/add_post_page/add_post.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {


  var img;
String ponnoController;
String conditionController;
String priceController;


   HomePage({Key? key,

     required this.img,
     required this.ponnoController,
     required this.conditionController,
     required this.priceController,


   }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        // backgroundColor: Color(0xffe8e9eb),
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

      body: Column(
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusColor: Colors.blueGrey,
                        hoverColor: Colors.blueGrey,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blueGrey
                          ),
                        ),
                        hintText: " এখানে সার্চ করুন"
                    ),
                  ),
                  height: 50,
                  width: 260,
                ),

                Container(
                  child:
                  InkWell(onTap: (){

                  },
                      child: Icon(Icons.search, color: Colors.white,)),
                  height:50,
                  width: 120,
                  color: Colors.red,
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),

          Expanded(
            child: GridView.builder(
              itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                   crossAxisSpacing: 1,
                   mainAxisSpacing: 40
                ),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 10),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blueGrey,
                                image: DecorationImage(
                                    image: (widget.img),fit: BoxFit.fitHeight)
                            ),

                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(widget.ponnoController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(widget.conditionController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: 
                            Row(
                              children: [
                                Text("টা:"),
                                Text(widget.priceController),
                              ],
                            ),
                          ),




                        ],
                      ),
                    ),
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(left:145, right: 145),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green
                ),
                onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (contex)=>AddPost()));
                },
                child:
                Row(
                  children: [
                    Icon(Icons.add_box_outlined, size: 20,),
                    Text("পোষ্ট করুন"),
                  ],
                )),
          ),

          SizedBox(height: 10,),

      ],
      )



    );
  }
}
