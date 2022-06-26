
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/post_model.dart';

class AddDataToFirebase{

  CollectionReference reference = FirebaseFirestore.instance.collection("userPost") ;

  void addData(PostModel post){
    reference.add({
      'username' : post.username?.displayName , 
      'postByUser' : post.postData
    }).then((value) => {
      print("PostAdded")
    }) ;
  }


}