import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';

class MotherhoodScreen extends StatelessWidget {
  static const String id = 'motherhood_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Motherhood', context: context),
      body: Text('Motherhood'),
    );
  }
}
