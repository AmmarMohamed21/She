import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:she/components/edit_profile_input.dart';
import 'package:she/components/input_label.dart';
import 'package:she/components/submit_button.dart';
import 'package:she/constants.dart';
import '../services/database.dart';

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
            InputLabel(label: 'Major'),
            TextField(
              cursorColor: kLightPrimaryColor,
              controller: TextEditingController(
                  text: Provider.of<Database>(context, listen: false)
                      .userData["Education"]["major"]),
              decoration: InputDecoration(
                focusedBorder: kUnderlineInputBorder,
              ),
              onChanged: (value) {
                Provider.of<Database>(context, listen: false)
                    .userData["Education"]["major"] = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            InputLabel(label: 'University'),
            EditProfileInput(
              controllerText: Provider.of<Database>(context, listen: false)
                  .userData["Education"]["university"],
              onChanged: (value) {
                Provider.of<Database>(context, listen: false)
                    .userData["Education"]["university"] = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            InputLabel(label: 'Birthdate'),
            EditProfileInput(
              controllerText: Provider.of<Database>(context, listen: false)
                  .userData["birthdate"],
              onChanged: (value) {
                Provider.of<Database>(context, listen: false)
                    .userData["birthdate"] = value;
              },
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
                Provider.of<Database>(context, listen: false)
                        .userData["birthdate"] =
                    date.day.toString() +
                        '/' +
                        date.month.toString() +
                        '/' +
                        date.year.toString();
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            InputLabel(label: 'Location'),
            EditProfileInput(
              controllerText: Provider.of<Database>(context, listen: false)
                  .userData["location"],
              onChanged: (value) {
                Provider.of<Database>(context, listen: false)
                    .userData["location"] = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            InputLabel(label: 'Add Interest'),
            EditProfileInput(
              onChanged: (value) {
                Provider.of<Database>(context, listen: false).newInterest =
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
