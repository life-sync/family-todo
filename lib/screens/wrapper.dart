import 'package:family_todolist/main.dart';
import 'package:family_todolist/screens/home.dart';
import 'package:family_todolist/screens/authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// void initializeFlutter() async {
//   await Firebase.initializeApp();
// }
FirebaseAuth auth = FirebaseAuth.instance;

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  @override
  Widget build(BuildContext context) {
    // auth.authStateChanges().listen((User user) {
    //   if (user == null) {
    //     return SignIn();
    //   } else {
    //     return Home();
    //   }
    //}
    return SignIn();
  }
}
