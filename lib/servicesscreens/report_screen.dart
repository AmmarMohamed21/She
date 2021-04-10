import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class ReportScreen extends StatefulWidget {
  static const String id = 'report_screen';
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Report', context: context),
      body: Text('Report'),
    );
  }
}
