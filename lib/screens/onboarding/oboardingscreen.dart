import 'package:flutter/material.dart';
import 'package:medcare/screens/signin/signinscreen.dart';
import 'package:medcare/screens/signup/signupscreen.dart';

import '../../util/constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  final List<OnboardingContent> contents = [
    OnboardingContent(
      title: 'Online Consultation',
      image: 'assets/images/onboard_layer1.png',
      description:
          "Connect with healthcare professionals virtually for convenient medical advice and support.",
    ),
    OnboardingContent(
      title: '24 Hours Ready to Serve',
      image: 'assets/images/onboard_layer2.png',
      description:
          "Instant access to expert medical assistance. Get the care you need, when you need it, with our app.",
    ),
    OnboardingContent(
      title: 'Medical Record Data Patient',
      image: 'assets/images/onboard_layer3.png',
      description:
          "Easily manage and access comprehensive health records, including medical history, test results, and treatment plans, all in one secure place.",
    ),
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 120,
          left: 28,
          right: 28,
          bottom: 60,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 31,
                      bottom: 31,
                      left: 28,
                      right: 28,
                    ),
                    child: Column(
                      children: [
                        Image.asset(contents[i].image, height: 300),
                        Text(
                          contents[i].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
            Container(
              height: 91,
              padding: EdgeInsets.only(top: 40),
              //margin: EdgeInsets.all(40),
              width: 372,
              child: ElevatedButton(
                child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                ),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => getstartedScreen()),
                    );
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.btnPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.btnPrimary,
      ),
    );
  }
}

//Onboarding screen
class OnboardingContent {
  late final String title, image, description;
  OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
  });
}

class getstartedScreen extends StatelessWidget {
  const getstartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28,
                  width: 98,

                  child: ElevatedButton(
                    child: Text(
                      'English',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.borderSecondary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 250),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset('assets/images/medcare_img.png')),
                Text(
                  'MEDCARE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.btnPrimary,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'We`re here to help keep you healthy',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 167),
                SizedBox(
                  height: 91,
                  width: 372,

                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      right: 10,
                      left: 10,
                    ),
                    child: ElevatedButton(
                      child: Text('Next', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationForm(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.btnPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 91,
                  width: 372,

                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      right: 10,
                      left: 10,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.btnPrimary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColors.btnPrimary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
