import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class TravelScreen extends StatefulWidget {
  static const String id = 'travel_screen';
  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Travel', context: context),
      body: Text('Travel'),
    );
  }
}
