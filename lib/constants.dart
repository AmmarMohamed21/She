import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

Color kPrimaryColor = Color(0xFFE91E63);
Color kLightPrimaryColor = Color(0xFFF8BBD0);
Color kDarkPrimaryColor = Color(0xFFC2185B);
Color kTextIcons = Color(0xFFFFFFFF);
Color kAccentColor = Color(0xFF9E9E9E);
Color kPrimaryText = Color(0xFF212121);
Color kSecondaryText = Color(0xFF757575);
Color kDivider = Color(0xFFBDBDBD);

Widget kInformationDivider = Divider(
  color: kDarkPrimaryColor,
  thickness: 2.0,
);

InputDecoration kInputStyle = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  ),
);

BoxDecoration kCardDecoration = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.pink,
      offset: Offset(0.0, 1.0),
      blurRadius: 3.0,
    ),
  ],
);
