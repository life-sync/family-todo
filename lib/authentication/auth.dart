import 'package:family_todolist/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
