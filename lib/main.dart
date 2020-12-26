import 'package:family_todolist/screens/authentication/home.dart';
import 'package:family_todolist/screens/authentication/signin.dart';
import 'package:family_todolist/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:family_todolist/authentication/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationProvider>().authState)
      ],
      child: MaterialApp(
        title: "Firebase Authentication",
        home: Authenticate(),
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseUser = context.watch<User>();

    if (FirebaseUser != null) {
      return Home();
    } else {
      return Auth_Home();
    }
  }
}
