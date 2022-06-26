
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/Screens/home_page.dart';

class Authenticate{

  final FirebaseAuth _auth = FirebaseAuth.instance ;

  void signInWithGoogle(BuildContext context) async{
    final GoogleSignInAccount? googleUser  =await GoogleSignIn().signIn() ;

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication ;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken ,
      idToken: googleAuth?.idToken , 
    ); 

    try {
      if(credential != null){
        FirebaseAuth.instance.signInWithCredential(credential) ;
        if(_auth.currentUser != null) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> HomePage()), (route) => false) ; 
        }
      }
    } catch (e) {
      print(e) ;
    }
    
  }

}