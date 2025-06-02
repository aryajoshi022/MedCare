import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding:  EdgeInsets.only(
          top: 120.h,
          left: 28.w,
          right: 28.w,
          bottom: 60.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    padding:  EdgeInsets.only(
                      top: 31.h,
                      bottom: 31.h,
                      left: 28.w,
                      right: 28.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30.h,),
                        Image.asset(contents[i].image, height: 300.h),
                        SizedBox(height: 50.h),

                        Text(
                          contents[i].title,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
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
              height: 91.h,
              padding: EdgeInsets.only(top: 40.h),
              //margin: EdgeInsets.all(40),
              width: 372.w,
              child: ElevatedButton(
                child: Text(
                  currentIndex == contents.length - 1 ? "Start" : "Next",
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
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    bool isActive = currentIndex == index;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.btnPrimary : AppColors.borderDisabled,
        borderRadius: BorderRadius.circular(20),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 20.h),
                  child: SizedBox(
                    height: 33.h,
                    width: 93.w,

                    child: ElevatedButton(
                      child: Text(
                        'English',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColors.borderSecondary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 250.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 40,),
                Center(child: Image.asset('assets/images/medcare_img.png',height: 91.58.h, width: 80.w)),
                SizedBox(height: 12.h),
                Text(
                  'MEDCARE',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.btnPrimary,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'We`re here to help keep you healthy',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 167.h),
                SizedBox(
                  height: 71.h,
                  width: 372.w,

                  child: Padding(
                    padding:  EdgeInsets.only(
                      top: 20.h,
                     // bottom: 20,
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: ElevatedButton(
                      child: Text('Next', style: TextStyle(fontSize: 16.sp)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>SignInScreen() ));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.btnPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 71.h,
                  width: 372.w,

                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    //  bottom: 20,
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.btnPrimary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColors.btnPrimary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(24.r),
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
