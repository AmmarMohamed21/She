import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:she/constants.dart';
import 'package:flutter/material.dart';
import 'package:she/screens/welcome_screen.dart';
import 'package:she/servicesscreens/jobs_screen.dart';
import '../components/resusable_card.dart';
import 'profile_screen.dart';
import '../components/main_app_bar.dart';
import '../servicesscreens/jobs_screen.dart';
import '../servicesscreens/courses_screen.dart';
import '../servicesscreens/inspiring_stories.dart';
import '../servicesscreens/internships_screen.dart';
import '../servicesscreens/report_screen.dart';
import '../servicesscreens/talent_exchange_screen.dart';
import '../servicesscreens/travel_screen.dart';
import '../servicesscreens/ventout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final firestore = FirebaseFirestore.instance;
User loggedInUser;

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  final _auth = FirebaseAuth.instance;

  void getCurrentUser() {
    User user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Our Services', context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    title: 'Jobs',
                    icon: Icons.work,
                    tapDetector: () {
                      Navigator.pushNamed(context, JobsScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: 'Courses',
                    icon: FontAwesomeIcons.book,
                    tapDetector: () {
                      Navigator.pushNamed(context, CoursesScreen.id);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    title: 'Travel',
                    icon: FontAwesomeIcons.planeDeparture,
                    tapDetector: () {
                      Navigator.pushNamed(context, TravelScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: 'Internships',
                    icon: FontAwesomeIcons.graduationCap,
                    tapDetector: () {
                      Navigator.pushNamed(context, InternshipsScreen.id);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    title: 'Vent Out',
                    icon: FontAwesomeIcons.handsHelping,
                    tapDetector: () {
                      Navigator.pushNamed(context, VentOutScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: 'Report',
                    icon: FontAwesomeIcons.ban,
                    tapDetector: () {
                      Navigator.pushNamed(context, ReportScreen.id);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    title: 'Talent Exchange',
                    icon: FontAwesomeIcons.solidHandshake,
                    tapDetector: () {
                      Navigator.pushNamed(context, TalentExchangeScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: 'Inspiring Stories',
                    icon: FontAwesomeIcons.fistRaised,
                    tapDetector: () {
                      Navigator.pushNamed(context, InspiringStoriesScreen.id);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
