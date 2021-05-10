import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:she/constants.dart';
import 'package:she/screens/home_screen.dart';
import '../components/rounded_button.dart';
import '../services/authentication.dart';
import '../components/loading_circle.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'package:flutter/scheduler.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool showSpinner = false;

  @override
  void initState() {
    if (Provider.of<Database>(context, listen: false).isUserSignedIn()) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        //might change this later
        Navigator.of(context).popAndPushNamed(HomeScreen.id);
      });
    }
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    animation = ColorTween(begin: kLightPrimaryColor, end: Colors.white)
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: LoadingCircle(),
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
                      Provider.of<Database>(context, listen: false)
                          .setLoggedInUser();
                      Navigator.popAndPushNamed(context, HomeScreen.id);
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
