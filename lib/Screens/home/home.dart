import 'package:flutter/material.dart';
import 'package:ligon_register/Screens/home/composent/body.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
