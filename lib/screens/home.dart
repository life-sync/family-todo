import 'package:family_todolist/authentication/auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text("Home"),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person_remove),
            label: Text("Sign Out"),
            onPressed: () async {
              _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        child: Text("Home"),
      ),
    );
  }
}
