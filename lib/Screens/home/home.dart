import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ligon_register/Screens/Welcome/welcome_screen.dart';
import 'package:ligon_register/Screens/home/composent/body.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _signedIn = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        setState(() {
          _signedIn = true;
        });
      }
    });
    if (_signedIn)
      return Body();
    else
      return WelcomeScreen();
  }
}
