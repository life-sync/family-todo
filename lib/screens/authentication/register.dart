import 'package:family_todolist/screens/authentication/signin.dart';
import 'package:family_todolist/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  String pass = "";
  bool loading = false;
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
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                }),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please Enter a Value";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              val = username;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Your Name",
                            hintStyle: TextStyle(fontFamily: "Plafair-Display"),
                            icon: Icon(
                              Icons.person,
                              color: Colors.red[300],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(color: Colors.red[300]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (EmailValidator.validate(val)) {
                              return null;
                            } else {
                              return "Please Enter a Valid Email Adress";
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              val = email;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            hintStyle: TextStyle(fontFamily: "Plafair-Display"),
                            icon: Icon(
                              Icons.email,
                              color: Colors.red[300],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(color: Colors.red[300]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val.isNotEmpty) {
                              if (val.length < 6) {
                                return "Password must be longer than 6 characters";
                              } else {
                                return null;
                              }
                            } else {
                              return "Enter a Password";
                            }
                          },
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              val = pass;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            hintStyle: TextStyle(fontFamily: "Plafair-Display"),
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.red[300],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(color: Colors.red[300]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        RaisedButton(
                          elevation: 0.0,
                          color: Colors.red[400],
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontFamily: "Merriweather",
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.red[400],
                                color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print("Login Succesfull");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          },
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
