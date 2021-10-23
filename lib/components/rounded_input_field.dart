import 'package:flutter/material.dart';

import 'package:ligon_register/components/text_field_container.dart';
import 'package:ligon_register/services/validotrs.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool inputText;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      required this.inputText})
      : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  get kPrimaryColor => null;
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
    setState(() {
      count++;
    });
    if (!widget.inputText) _myController.clear();
    return TextFieldContainer(
      child: TextField(
        controller: _myController,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          errorText: count > 1
              ? Validator.validateEmail(email: _myController.value.text)
              : null,
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
