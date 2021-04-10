import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class EditProfileScreen extends StatelessWidget {
  String major;
  String university;
  String birthdate;
  String location;
  String interest;
  Function getValues;
  EditProfileScreen(
      {this.major,
      this.university,
      this.birthdate,
      this.location,
      this.getValues});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Major',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              cursorColor: kLightPrimaryColor,
              decoration: kInputStyle,
              controller: TextEditingController(text: major),
              onChanged: (value) {
                major = value;
                print(major);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'University',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              cursorColor: kLightPrimaryColor,
              decoration: kInputStyle,
              controller: TextEditingController(text: university),
              onChanged: (value) {
                university = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Birthdate',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              cursorColor: kLightPrimaryColor,
              decoration: kInputStyle,
              controller: TextEditingController(text: birthdate),
              onChanged: (value) {
                birthdate = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              cursorColor: kLightPrimaryColor,
              decoration: kInputStyle,
              controller: TextEditingController(text: location),
              onChanged: (value) {
                location = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Add interest',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              cursorColor: kLightPrimaryColor,
              decoration: kInputStyle,
              onChanged: (value) {
                interest = value;
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                getValues(location, interest, birthdate, major, university);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor)),
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
