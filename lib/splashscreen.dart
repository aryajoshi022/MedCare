import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medcare/screens/onboarding/oboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => onBoardingScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Splash Screen'));
  }
}
