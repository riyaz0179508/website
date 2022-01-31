import 'dart:io';

import 'package:beca_kena/add_post_page/add_post.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
            itemCount: 50,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index){
                return
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      height: 300,
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blueGrey,
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),fit: BoxFit.fitHeight)
                          ),

                        ),
                        Text("Price: 500 Tk"),
                        Text("Table sell"),
                        Text("New"),


                      ],
                    ),


                     ),
                  );
              }
          ),
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
