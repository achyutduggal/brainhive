import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brainhive/Components/Roundbutton.dart';
import 'package:brainhive/Screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _titleAnimation;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _titleAnimation = Tween<double>(
      begin: 0.0,
      end: 15.0,
    ).animate(_controller);

    animation = ColorTween(begin: Colors.lightBlueAccent, end: Colors.blue)
        .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FadeTransition(
              opacity: _opacityAnimation,
              child: Image.asset(
                'assets/images/books.png',
                height: 200.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    '  BrainHive',
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            GradientButtonFb4(
              text: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            GradientButtonFb4(
              text: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
