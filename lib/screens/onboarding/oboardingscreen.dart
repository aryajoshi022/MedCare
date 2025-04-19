import 'package:flutter/material.dart';

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
      body: Column(
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
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 121.04),
                        child: Image.asset(contents[i].image, height: 300),
                      ),
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
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
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
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
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
        color: Theme.of(context).primaryColor,
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
      body: Column(
        children: [
          Center(child: Image.asset('assets/images/splash_logo.png')),
          ElevatedButton(
            child: Text('Register', style: TextStyle(fontSize: 16)),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
