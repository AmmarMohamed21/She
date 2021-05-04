import 'package:flutter/material.dart';
import 'package:she/components/submit_button.dart';
import 'package:she/constants.dart';
import '../components/main_app_bar.dart';
import 'package:provider/provider.dart';
import '../services/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
User loggedInUser;

class ReportScreen extends StatelessWidget {
  static const String id = 'report_screen';
  String incidentDate;
  String title;
  String description;
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Report', context: context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (value) =>
                      value.isEmpty ? 'Please provide a Title' : null,
                  cursorColor: kLightPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Title...',
                    border: kInputBorder,
                    focusedBorder: kFocusedBorder,
                  ),
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  // controller: incidentDate != null
                  //     ? TextEditingController(text: incidentDate)
                  //     : null,
                  controller: dateController,
                  cursorColor: kLightPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Incident Date...',
                    border: kInputBorder,
                    focusedBorder: kFocusedBorder,
                  ),
                  onTap: () async {
                    DateTime date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
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
                    incidentDate = date.day.toString() +
                        '/' +
                        date.month.toString() +
                        '/' +
                        date.year.toString();
                    dateController.text = incidentDate;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Please provide a Date' : null,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  maxLines: 20,
                  onChanged: (value) {
                    description = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Please provide Details' : null,
                  cursorColor: kLightPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Describe the incident in details...',
                    border: kInputBorder,
                    focusedBorder: kFocusedBorder,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SubmitButton(
                  text: 'Submit',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final _auth = FirebaseAuth.instance;
                      User user = _auth.currentUser;
                      if (user != null) {
                        loggedInUser = user;
                      }
                      try {
                        firestore.collection('incidents').add({
                          'title': title,
                          'incidentDate': incidentDate,
                          'description': description,
                          'userID': loggedInUser.uid
                        });
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
