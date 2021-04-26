import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class TravelProgramsScreen extends StatelessWidget {
  static const String id = 'travel_programs_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Travel Programs', context: context),
      body: Text('Travel Programs'),
    );
  }
}
