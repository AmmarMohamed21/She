import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class SwitchScreen extends StatelessWidget {
  static final String id = 'switch_screen';
  @override
  Widget build(BuildContext context) {
    return Provider.of<Database>(context, listen: false).isUserSignedIn()
        ? HomeScreen()
        : LoginScreen();
  }
}
