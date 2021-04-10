import 'package:flutter/material.dart';
import 'package:she/constants.dart';
import '../screens/profile_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/home_screen.dart';

AppBar getAppBar({String title, BuildContext context}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    leading: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Hero(
        tag: 'logo',
        child: GestureDetector(
          onTap: () {
            if (ModalRoute.of(context).settings.name != HomeScreen.id)
              Navigator.pushNamed(context, HomeScreen.id);
          },
          child: Container(
            child: Image.asset('assets/icon/icon.png'),
          ),
        ),
      ),
    ),
    title: Text(title),
    actions: [
      PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text('Profile'),
            value: Profile.id,
          ),
          PopupMenuItem(
            child: Text('Sign Out'),
            value: WelcomeScreen.id,
          ),
        ],
        onSelected: (route) {
          Navigator.pushNamed(context, route);
        },
      )
    ],
  );
}
