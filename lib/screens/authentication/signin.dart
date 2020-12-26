import 'package:family_todolist/authentication/auth.dart';
import 'package:family_todolist/screens/authentication/register.dart';
import 'package:family_todolist/screens/home.dart';
import 'package:family_todolist/screens/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String pass = "";
  String error = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Sign in",
                style: TextStyle(
                    fontFamily: "PlayFair-Display",
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red[400],
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
                                if (EmailValidator.validate(val)) {
                                  return null;
                                } else {
                                  return "Please Enter a Valid Email Adress";
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Your Email",
                                hintStyle:
                                    TextStyle(fontFamily: "Plafair-Display"),
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.red[300],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide:
                                      BorderSide(color: Colors.red[300]),
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
                                  pass = val;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Your Password",
                                hintStyle:
                                    TextStyle(fontFamily: "Plafair-Display"),
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.red[300],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide:
                                      BorderSide(color: Colors.red[300]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            RaisedButton(
                              elevation: 0.0,
                              color: Colors.red[400],
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontFamily: "Merriweather",
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.red[400],
                                    color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  loading = true;
                                  dynamic result = await _auth
                                      .signinWithEmailPass(email, pass);
                                  if (result == null) {
                                    loading = false;
                                    setState(() {
                                      error =
                                          "Couldnt login with those credentials";
                                    });
                                  } else {
                                    loading = false;
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              error,
                              style: TextStyle(
                                color: Colors.red[600],
                              ),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ));
  }
}
