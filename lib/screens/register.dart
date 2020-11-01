import 'package:family_todolist/screens/signin.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(
              fontFamily: "PlayFair-Display", fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person_add),
              label: Text("Sign In"),
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              }),
        ],
      ),
    );
  }
}
