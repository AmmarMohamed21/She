import 'package:flutter/material.dart';
import 'package:she/components/loading_circle.dart';
import 'package:she/components/submit_button.dart';
import 'package:she/constants.dart';
import 'package:she/services/image_uploader.dart';
import '../components/main_app_bar.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ReportFormScreen extends StatefulWidget {
  static const String id = 'report_screen';

  @override
  _ReportFormScreenState createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  String incidentDate;

  String description;

  final _formKey = GlobalKey<FormState>();

  bool submitting = false;

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Report', context: context),
      body: submitting
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingCircle(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Recording incident, please wait...'),
                ],
              ),
            )
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        maxLines: 15,
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
                      TextFormField(
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
                      ImageUploader(),
                      SizedBox(
                        height: 10.0,
                      ),
                      SubmitButton(
                        text: 'Submit',
                        onPressed: () async {
                          String message;
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              submitting = true;
                            });
                            try {
                              await Provider.of<Database>(context,
                                      listen: false)
                                  .addIncident(incidentDate, description);
                              message = 'Your incident has been recorded';
                            } catch (e) {
                              message =
                                  'Something went wrong, your incident was not recorded.';
                            }
                            SnackBar snackBar = SnackBar(
                              content: Text(
                                message,
                              ),
                            );
                            setState(() {
                              submitting = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pop(context);
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
