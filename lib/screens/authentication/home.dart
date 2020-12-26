import 'package:family_todolist/screens/authentication/register.dart';
import 'package:family_todolist/screens/authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Auth_Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome!",
          style: TextStyle(
            fontFamily: "Playfair Display",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[500],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  color: Colors.blue[700],
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  label: Text("Login With Facebook",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))),
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.grey[200]),
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.grey[200])
            ],
          ),
        ],
      ),
    );
  }
}
