import 'package:flutter/material.dart';

import 'package:ligon_register/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;

  final ValueChanged<String> onChanged;
  const RoundedInputField({
    required this.hintText,
    required this.onChanged,
  });

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
