import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class VentOutScreen extends StatefulWidget {
  static const String id = 'vent_out_screen';
  @override
  _VentOutScreenState createState() => _VentOutScreenState();
}

class _VentOutScreenState extends State<VentOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Vent Out', context: context),
      body: Text('Vent Out'),
    );
  }
}
