import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:she/constants.dart';
import 'package:she/screens/home_screen.dart';
import 'package:she/screens/profile_screen.dart';
import '../components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';
import '../services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animatedColor;
  bool showSpinner = false;
  void initialization() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    initialization();
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    animation = ColorTween(begin: kLightPrimaryColor, end: Colors.white)
        .animate(controller);
    animatedColor = ColorTween(begin: kPrimaryColor, end: kPrimaryColor)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: CircularProgressIndicator(
          valueColor: animatedColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/icon/icon.png'),
                  height: 150.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'She - هي',
                    textAlign: TextAlign.center,
                    speed: Duration(
                      milliseconds: 100,
                    ),
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                buttonColor: kPrimaryColor,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user =
                        await Authentication.signInWithGoogle(context: context);
                    if (user != null) {
                      Navigator.pushNamed(context, HomeScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    print(e);
                  }
                },
                text: 'Sign in with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
