import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:she/components/interests_list.dart';
import 'package:she/constants.dart';
import 'package:she/screens/edit_profile_screen.dart';
import '../components/main_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../components/information_row.dart';
import '../components/information_list.dart';
import '../services/database.dart';
import 'package:provider/provider.dart';

// final firestore = FirebaseFirestore.instance;
// User loggedInUser;

class Profile extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  bool showSpinner = true;
  Animation animatedColor;
  AnimationController controller;
  final _auth = FirebaseAuth.instance;
  String userBirthDate = '';
  String userLocation = '';
  List<dynamic> userInterests = [];
  Map userEducation = {'major': '', 'university': ''};

  Future<void> updateData() async {
    await Provider.of<Database>(context, listen: false).getUserFirebaseData();
    showSpinner = false;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    animatedColor = ColorTween(begin: kPrimaryColor, end: kPrimaryColor)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Profile', context: context),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: CircularProgressIndicator(
          valueColor: animatedColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  foregroundImage: NetworkImage(
                      Provider.of<Database>(context, listen: false)
                          .loggedInUser
                          .photoURL),
                  backgroundImage: AssetImage('assets/pp.png'),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  Provider.of<Database>(context, listen: false)
                      .loggedInUser
                      .displayName,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      InformationRow(
                          title: 'Email',
                          value: Provider.of<Database>(context, listen: false)
                              .loggedInUser
                              .email),
                      kInformationDivider,
                      InformationRow(
                        title: 'Birthdate',
                        value: Provider.of<Database>(context, listen: false)
                            .getUserData()["birthdate"],
                      ),
                      kInformationDivider,
                      InformationRow(
                          title: 'Location',
                          value: Provider.of<Database>(context)
                              .getUserData()["location"]),
                      kInformationDivider,
                      InformationList(title: 'Education', values: [
                        Provider.of<Database>(context, listen: false)
                            .getUserData()["Education"]["major"],
                        Provider.of<Database>(context, listen: false)
                            .getUserData()["Education"]["university"],
                      ]),
                      kInformationDivider,
                      InterestsList(
                        title: 'Interests',
                        values: Provider.of<Database>(context, listen: false)
                            .getUserData()["interests"],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.edit),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: EditProfileScreen(
                major: Provider.of<Database>(context, listen: false)
                    .userData["Education"]["major"],
                university: Provider.of<Database>(context, listen: false)
                    .userData["Education"]["university"],
                birthdate: Provider.of<Database>(context, listen: false)
                    .userData["birthdate"],
                location: Provider.of<Database>(context, listen: false)
                    .userData["location"],
                getValues: () async {
                  //to be refactored
                  showSpinner = true;
                  Provider.of<Database>(context, listen: false).addInterest();
                  try {
                    await Provider.of<Database>(context, listen: false)
                        .updateUserFirebaseData();
                  } catch (err) {}

                  updateData();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
