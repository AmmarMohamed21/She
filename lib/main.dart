import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:she/screens/report_form_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'servicesscreens/jobs_screen.dart';
import 'servicesscreens/courses_screen.dart';
import 'servicesscreens/inspiring_stories.dart';
import 'servicesscreens/internships_screen.dart';
import 'servicesscreens/motherhood_screen.dart';
import 'servicesscreens/talent_exchange_screen.dart';
import 'servicesscreens/travel_programs_screen.dart';
import 'servicesscreens/women_safety_screen.dart';
import 'package:provider/provider.dart';
import 'services/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Database(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'RocknRollOne'),
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          Profile.id: (context) => Profile(),
          JobsScreen.id: (context) => JobsScreen(),
          CoursesScreen.id: (context) => CoursesScreen(),
          InspiringStoriesScreen.id: (context) => InspiringStoriesScreen(),
          InternshipsScreen.id: (context) => InternshipsScreen(),
          MotherhoodScreen.id: (context) => MotherhoodScreen(),
          TalentExchangeScreen.id: (context) => TalentExchangeScreen(),
          TravelProgramsScreen.id: (context) => TravelProgramsScreen(),
          WomenSafetyScreen.id: (context) => WomenSafetyScreen(),
          ReportFormScreen.id: (context) => ReportFormScreen(),
        },
      ),
    );
  }
}
