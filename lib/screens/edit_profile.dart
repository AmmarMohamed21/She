import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:she/components/submit_button.dart';
import 'package:she/constants.dart';
import '../services/user_data.dart';

class EditProfileScreen extends StatelessWidget {
  final String major;
  final String university;
  final String birthdate;
  final String location;
  final Function getValues;

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
              controller: TextEditingController(
                  text: Provider.of<UserData>(context, listen: false)
                      .data["Education"]["major"]),
              decoration: InputDecoration(
                focusedBorder: kUnderlineInputBorder,
              ),
              onChanged: (value) {
                Provider.of<UserData>(context, listen: false).data["Education"]
                    ["major"] = value;
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
              controller: TextEditingController(
                  text: Provider.of<UserData>(context, listen: false)
                      .data["Education"]["university"]),
              cursorColor: kLightPrimaryColor,
              decoration: InputDecoration(
                focusedBorder: kUnderlineInputBorder,
              ),
              onChanged: (value) {
                Provider.of<UserData>(context, listen: false).data["Education"]
                    ["university"] = value;
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
              controller: TextEditingController(
                  text: Provider.of<UserData>(context, listen: false)
                      .data["birthdate"]),
              decoration: InputDecoration(
                focusedBorder: kUnderlineInputBorder,
              ),
              onTap: () async {
                DateTime date = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1920),
                  lastDate: DateTime.now(),
                  builder: (context, Widget child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light().copyWith(
                          primary: kPrimaryText,
                          onPrimary: kPrimaryColor,
                        ),
                      ),
                      child: child,
                    );
                  },
                );
                Provider.of<UserData>(context, listen: false)
                        .data["birthdate"] =
                    date.day.toString() +
                        '/' +
                        date.month.toString() +
                        '/' +
                        date.year.toString();
              },
              onChanged: (value) {
                Provider.of<UserData>(context, listen: false)
                    .data["birthdate"] = value;
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
              controller: TextEditingController(
                  text: Provider.of<UserData>(context, listen: false)
                      .data["location"]),
              cursorColor: kLightPrimaryColor,
              decoration: InputDecoration(
                focusedBorder: kUnderlineInputBorder,
              ),
              onChanged: (value) {
                Provider.of<UserData>(context, listen: false).data["location"] =
                    value;
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
              decoration: InputDecoration(
                focusedBorder: kUnderlineInputBorder,
              ),
              onChanged: (value) {
                Provider.of<UserData>(context, listen: false).newInterest =
                    value;
              },
            ),
            SubmitButton(
              onPressed: () {
                Navigator.pop(context);
                getValues();
              },
              text: 'Edit',
            ),
          ],
        ),
      ),
    );
  }
}
