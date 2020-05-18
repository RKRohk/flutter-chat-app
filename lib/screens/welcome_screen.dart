import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/mypadding.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
 

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      upperBound: 1,
      lowerBound: 0,
      duration: Duration(seconds: 1),
      vsync: this,
      
    );

    animation = ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);

    controller.forward();

  

    controller.addListener(() {
      setState(() {
        
      });
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
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                    speed: Duration(seconds: 1),
                    text: ['Flash Chat'],       
                    isRepeatingAnimation: true,       
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyPadding(text: 'Log in',color: Colors.lightBlueAccent,onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            MyPadding(text: 'Sign Up',color: Colors.lightBlue,onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },)
          ],
        ),
      ),
    );
  }
}


