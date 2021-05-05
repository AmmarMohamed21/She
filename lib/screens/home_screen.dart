import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:she/servicesscreens/jobs_screen.dart';
import '../components/service_card.dart';
import '../components/main_app_bar.dart';
import '../servicesscreens/jobs_screen.dart';
import '../servicesscreens/courses_screen.dart';
import '../servicesscreens/inspiring_stories.dart';
import '../servicesscreens/internships_screen.dart';
import '../servicesscreens/motherhood_screen.dart';
import '../servicesscreens/talent_exchange_screen.dart';
import '../servicesscreens/travel_programs_screen.dart';
import '../servicesscreens/women_safety_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

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
                  child: ServiceCard(
                    title: 'Women Safety',
                    icon: FontAwesomeIcons.handsHelping,
                    tapDetector: () {
                      Navigator.pushNamed(context, WomenSafetyScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ServiceCard(
                    title: 'Motherhood',
                    icon: Icons.pregnant_woman,
                    tapDetector: () {
                      Navigator.pushNamed(context, MotherhoodScreen.id);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServiceCard(
                    title: 'Jobs',
                    icon: Icons.work,
                    tapDetector: () {
                      Navigator.pushNamed(context, JobsScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ServiceCard(
                    title: 'Internships',
                    icon: FlutterIcons.graduation_cap_ent,
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
                  child: ServiceCard(
                    title: 'Courses',
                    icon: FontAwesomeIcons.book,
                    tapDetector: () {
                      Navigator.pushNamed(context, CoursesScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ServiceCard(
                    title: 'Travel Programs',
                    icon: FlutterIcons.md_airplane_ion,
                    tapDetector: () {
                      Navigator.pushNamed(context, TravelProgramsScreen.id);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServiceCard(
                    title: 'Talent Exchange',
                    icon: FontAwesomeIcons.solidHandshake,
                    tapDetector: () {
                      Navigator.pushNamed(context, TalentExchangeScreen.id);
                    },
                  ),
                ),
                Expanded(
                  child: ServiceCard(
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
