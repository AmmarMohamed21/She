import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'servicesscreens/jobs_screen.dart';
import 'servicesscreens/courses_screen.dart';
import 'servicesscreens/inspiring_stories.dart';
import 'servicesscreens/internships_screen.dart';
import 'servicesscreens/report_screen.dart';
import 'servicesscreens/talent_exchange_screen.dart';
import 'servicesscreens/travel_screen.dart';
import 'servicesscreens/ventout_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'RocknRollOne'),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        Profile.id: (context) => Profile(),
        JobsScreen.id: (context) => JobsScreen(),
        CoursesScreen.id: (context) => CoursesScreen(),
        InspiringStoriesScreen.id: (context) => InspiringStoriesScreen(),
        InternshipsScreen.id: (context) => InternshipsScreen(),
        ReportScreen.id: (context) => ReportScreen(),
        TalentExchangeScreen.id: (context) => TalentExchangeScreen(),
        TravelScreen.id: (context) => TravelScreen(),
        VentOutScreen.id: (context) => VentOutScreen(),
      },
    );
  }
}
