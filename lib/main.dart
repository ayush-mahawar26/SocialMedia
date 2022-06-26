import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media/Screens/sign_in.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp() ;
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  SignIn(),
    ); 
  }
}