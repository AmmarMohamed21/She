import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class EditProfileInput extends StatelessWidget {
  final String controllerText;
  final Function onTap;
  final Function onChanged;

  EditProfileInput({this.controllerText, this.onTap, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerText != null
          ? TextEditingController(
              text: controllerText,
            )
          : null,
      cursorColor: kLightPrimaryColor,
      decoration: InputDecoration(
        focusedBorder: kUnderlineInputBorder,
      ),
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
