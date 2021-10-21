import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ligon_register/Screens/Login/login_screen.dart';
import 'package:ligon_register/Screens/Signup/signup_screen.dart';
import 'package:ligon_register/Screens/Welcome/welcome_screen.dart';
import 'package:ligon_register/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      initialRoute: '/',
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
      },
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
