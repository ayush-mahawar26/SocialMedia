
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/post_model.dart';
import 'package:social_media/services/post_data.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({ Key? key }) : super(key: key);

  TextEditingController postData =  TextEditingController() ;
  final FirebaseAuth _auth = FirebaseAuth.instance ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)), 
                    borderSide: BorderSide(
                      width: 2 ,
                      color: Colors.black
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)), 
                    borderSide: BorderSide(
                      width: 2 ,
                      color: Colors.black
                    )
                  )
                ),
                controller: postData,
                maxLines: 10,
              ),
            ), 

            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: ElevatedButton(onPressed: (){

                PostModel userData = PostModel(postData.text , _auth.currentUser);

                AddDataToFirebase().addData(userData) ;
                Navigator.pop(context) ;

              }, child: Text("Post")))
          ],
        ),
      ),
    );
  }
}