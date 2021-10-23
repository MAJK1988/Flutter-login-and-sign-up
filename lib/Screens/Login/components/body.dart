import 'package:flutter/material.dart';
import 'package:ligon_register/Screens/Login/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ligon_register/Screens/Signup/signup_screen.dart';
import 'package:ligon_register/components/already_have_an_account_acheck.dart';
import 'package:ligon_register/components/rounded_button.dart';
import 'package:ligon_register/components/rounded_input_field.dart';
import 'package:ligon_register/components/rounded_password_field.dart';
import 'package:ligon_register/constants.dart';
import 'package:ligon_register/services/validotrs.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String email = '', passWord = '';
  late bool setText = true;
  late int count = 0;
  @override
  Widget build(BuildContext context) {
    if (!setText && count != 0) {
      setState(() {
        setText = true;
      });
    } else if (!setText && count == 0)
      setState(() {
        count++;
      });
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              inputText: setText,
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  passWord = value;
                });
              },
              hintText: 'Password',
              inputText: setText,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (!Validator.checkEmpty(email, passWord)) {
                  setState(() {
                    email = '';
                    passWord = '';
                    setText = false;
                    count = 0;
                  });
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
