
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/Screens/add_post.dart';
import 'package:social_media/post_tile_model.dart';

class HomePage extends StatelessWidget {
   HomePage({ Key? key }) : super(key: key);
  Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance.collection("userPost").snapshots() ;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddPostScreen()));
        } , 
          child: const Icon(Icons.edit),
        ),
      appBar: AppBar(
        title: Text("SocialMedia"),
      ),

      body: StreamBuilder<QuerySnapshot>( 
        stream: collectionStream,
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
            const Center(
            child: CircularProgressIndicator(),
            );
            }

            return ListView.builder(
            itemCount: snapshot.data?.size, 
            itemBuilder: (context, index){
            return PostTile().TileOfPost(context, snapshot.data?.docs[index]["username"], snapshot.data?.docs[index]["postByUser"]);
            },
          );
          },
        ),

    ); 
  }
}