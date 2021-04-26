import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class CoursesScreen extends StatelessWidget {
  static const String id = 'courses_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Courses', context: context),
      body: Text('Courses'),
    );
  }
}
