import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class LoadingCircle extends StatefulWidget {
  @override
  _LoadingCircleState createState() => _LoadingCircleState();
}

class _LoadingCircleState extends State<LoadingCircle>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animatedColor;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    animatedColor = ColorTween(begin: kPrimaryColor, end: kPrimaryColor)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    // animationController.dispose() instead of your controller.dispose
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: animatedColor,
    );
  }
}
