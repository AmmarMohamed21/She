import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:she/constants.dart';
import 'package:she/screens/edit_profile.dart';
import '../components/main_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../components/information_row.dart';
import '../components/information_list.dart';

final firestore = FirebaseFirestore.instance;
User loggedInUser;

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
  void getCurrentUser() {
    User user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  Future<void> getUserData() async {
    String userID = loggedInUser.uid;
    var data;

    var document = await firestore.collection('users').doc(userID).get();
    if (document.data() == null) {
      data = {
        "location": '',
        "birthdate": '',
        "Education": {
          "major": '',
          "university": '',
        },
        "interests": [],
      };
      firestore.collection('users').doc(userID).set(data);
      document = await firestore.collection('users').doc(userID).get();
    }

    setState(() {
      userBirthDate = document.data()['birthdate'];
      userInterests = document.data()['interests'];
      userEducation = document.data()['Education'];
      userLocation = document.data()['location'];
    });
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
    getCurrentUser();
    getUserData();
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
                  foregroundImage: NetworkImage(loggedInUser.photoURL),
                  backgroundImage: AssetImage('assets/pp.png'),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  loggedInUser.displayName,
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
                      InformationRow(title: 'Email', value: loggedInUser.email),
                      kInformationDivider,
                      InformationRow(title: 'Birthdate', value: userBirthDate),
                      kInformationDivider,
                      InformationRow(title: 'Location', value: userLocation),
                      kInformationDivider,
                      InformationList(title: 'Education', values: [
                        userEducation['major'],
                        userEducation['university']
                      ]),
                      kInformationDivider,
                      InformationList(
                          title: 'Interests', values: userInterests),
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
                major: userEducation['major'],
                university: userEducation['university'],
                birthdate: userBirthDate,
                location: userLocation,
                getValues: (String editedLocation,
                    String editedInterest,
                    String editedBirthdate,
                    String editedMajor,
                    String editedUni) async {
                  showSpinner = true;
                  String userID = loggedInUser.uid;
                  if (userInterests == null) {
                    userInterests = [];
                  }
                  if (editedInterest != null) userInterests.add(editedInterest);
                  var data = {
                    "location": editedLocation,
                    "birthdate": editedBirthdate,
                    "Education": {
                      "major": editedMajor,
                      "university": editedUni,
                    },
                    "interests": userInterests
                  };
                  await firestore.collection('users').doc(userID).update(data);
                  await getUserData();
                  showSpinner = false;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
