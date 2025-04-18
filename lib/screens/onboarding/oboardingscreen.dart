import 'package:flutter/material.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text('ONboarding SCreen')));
  }
}

class OnboardingContent {
  final String title, image, description;

  List<OnboardingContent> contents = [
    OnboardingContent(
      title: 'Online Consultation',
      image: 'assets/images/onboard_layer1.png',
      description:
          "Connect with healthcare professionals virtually for convenient medical advice and support.",
    ),
    OnboardingContent(
      title: '24 Hours Ready to Serve',
      image: 'assets/images/onboard_layer1.png',
      description:
          "Instant access to expert medical assistance. Get the care you need, when you need it, with our app.",
    ),
    OnboardingContent(
      title: 'Medical Record Data Patient',
      image: 'assets/images/onboard_layer1.png',
      description:
          " Easily manage and access comprehensive health records, including medical history, test results, and treatment plans, all in one secure place.",
    ),
  ];

  OnboardingContent({
    required this.title,
    required this.image,
    required this.description,
  });
}
