import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class CoursesScreen extends StatefulWidget {
  static const String id = 'courses_screen';
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Courses', context: context),
      body: Text('Courses'),
    );
  }
}
