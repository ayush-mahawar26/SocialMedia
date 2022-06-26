
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:social_media/Screens/home_page.dart';
import 'package:social_media/services/authentication.dart';

class SignIn extends StatelessWidget {
  SignIn({ Key? key }) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(  
                Buttons.Google , 
                onPressed: ()async{
                  Authenticate().signInWithGoogle(context) ;
                },
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}