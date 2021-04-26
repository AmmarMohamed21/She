import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class WomenSafetyScreen extends StatelessWidget {
  static const String id = 'women_safety_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Women Safety', context: context),
      body: Text('Women Safety'),
    );
  }
}
