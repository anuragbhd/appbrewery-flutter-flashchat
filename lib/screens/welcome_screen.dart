import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController _logoAnimationCtrl, _bgAnimationCtrl;
  Animation _logoAnimation, _bgAnimation;

  @override
  void initState() {
    super.initState();

    this.animateLogo();
    this.animateBackground();
  }

  void animateLogo() {
    this._logoAnimationCtrl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    this._logoAnimationCtrl.addListener(() => this.setState(() {}));

    this._logoAnimation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: this._logoAnimationCtrl,
    );

    this._logoAnimationCtrl.forward();
  }

  void animateBackground() {
    this._bgAnimationCtrl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    this._bgAnimationCtrl.addListener(() => this.setState(() {}));

    this._bgAnimation = ColorTween(
      begin: Colors.yellowAccent,
      end: Colors.white,
    ).animate(this._bgAnimationCtrl);

    this._bgAnimationCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this._bgAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: this._logoAnimation.value * 100,
                    //height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
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
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              text: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
