import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class TalentExchangeScreen extends StatelessWidget {
  static const String id = 'talent_exchange_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Talent Exchange', context: context),
      body: Text('Talent Exchange'),
    );
  }
}
