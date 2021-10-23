import 'package:flutter/material.dart';
import 'package:ligon_register/components/text_field_container.dart';
import 'package:ligon_register/services/validotrs.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool inputText;
  const RoundedPasswordField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      required this.inputText})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  get kPrimaryColor => null;
  bool vesiblity = true;
  late TextEditingController _myController;
  @override
  void initState() {
    super.initState();
    _myController = TextEditingController();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (!widget.inputText) _myController.clear();
    setState(() {
      count++;
    });
    return TextFieldContainer(
      child: TextField(
        controller: _myController,
        obscureText: vesiblity,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          errorText: count > 1
              ? Validator.validatePassword(password: _myController.value.text)
              : null,
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: vesiblity
                ? new Icon(Icons.visibility)
                : new Icon(Icons.visibility_off),
            color: kPrimaryColor,
            onPressed: () {
              setState(() {
                vesiblity = !vesiblity;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
