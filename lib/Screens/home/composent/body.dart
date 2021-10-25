import 'package:flutter/material.dart';
import 'package:ligon_register/components/rounded_button.dart';
import 'package:ligon_register/services/auth.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return SingleChildScrollView(
        child: Center(
            child: RoundedButton(
      text: "Log OUT",
      press: () {
        FireAuth.logOut(context: context);
      },
    )));
  }
}
