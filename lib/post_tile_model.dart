
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/post_model.dart';

class PostTile{
  final FirebaseAuth _auth = FirebaseAuth.instance ; 


  Widget TileOfPost(BuildContext context ,String userName , String postData){
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10 ,
              horizontal: 20
            ),
            child: Row(
              children: [
                const Icon(CupertinoIcons.profile_circled) , 
                Text(userName, 
                  style: const TextStyle(
                    fontSize: 20 , 
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ), 

          Padding(
            padding:const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.76,
              child: Text(
                postData, 
                textAlign: TextAlign.start,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                Icon(CupertinoIcons.heart) , 
                Text("0")
              ],
            ),
          )
        ],
      ),
    ); 
  }

}