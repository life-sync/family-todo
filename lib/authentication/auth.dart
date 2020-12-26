import 'package:family_todolist/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
  // FirebaseAuth instance
  AuthenticationProvider(this.firebaseAuth);
  //constructor to intialize the firebase instance

  Stream<User> get authState => firebaseAuth.idTokenChanges();
}

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  // Register with emaila nd pass
  Future RegisterWithEmailPass(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signinWithEmailPass(String email, String pass) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    await auth.signOut();
  }
}
