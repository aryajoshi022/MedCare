import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/screens/signup/signupscreen.dart';

import '../../util/constants/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  Widget _buildToggleTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_tabButton("No Phone", 0), _tabButton("Email", 1)],
    );
  }
  Widget _tabButton(String title, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => _switchPage(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          //color: isActive ? AppColors.btnPrimary : Colors.grey.shade300,
          //borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.btnPrimary : AppColors.borderSecondary,
            //color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  void _switchPage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  Widget _verifylogin() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 23,right: 23,bottom: 60,top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, weight: 7),
              ),
              SizedBox(height: 10,),
              Text(
                'Enter your phone number or email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30.h),
              _buildToggleTabs(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) => setState(() => _currentIndex = index),
                  children: [_nophonelogin(), _emaillogin()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _emaillogin() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 3,
                    width: 80,
                    child: LinearProgressIndicator(
                      value: 200 / 400, //current / max
                      backgroundColor: AppColors.bgPrimary,
                      color: AppColors.borderThirsty,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          Text(
            'Email',
            style: TextStyle(fontSize: 16, color: AppColors.btnPrimary,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 45,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter phone email',
                hintStyle: TextStyle(color: AppColors.textDisabled,fontSize: 14,fontWeight: FontWeight.w400),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Is there an issue with your email?',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textBtn,
              fontWeight: FontWeight.w400,
            ),
          ),Spacer(),
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
                child: Text('Login', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => _verificationcompleted(),));
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don`t have a MedCare Account yet ? ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignScreen(),));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.btnPrimary,
                    ),)
              ),

            ],
          ),
        ],
      ),
    );
  }
  Widget _nophonelogin() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 3,
                    width: 80,
                    child: LinearProgressIndicator(
                      value: 200 / 400, //current / max
                      backgroundColor: AppColors.borderThirsty,
                      color: AppColors.bgPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          Text(
            'No phone',
            style: TextStyle(fontSize: 16, color: AppColors.textBtn,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 45,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter phone number',
                hintStyle: TextStyle(color: AppColors.textDisabled,fontSize: 14,fontWeight: FontWeight.w400),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Is there an issue with your phone number?',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textBtn,
              fontWeight: FontWeight.w400,
            ),
          ),Spacer(),
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
                child: Text('Login', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => _verificationcompleted(),));
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don`t have a MedCare Account yet ? ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignScreen(),));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.btnPrimary,
                      ),)
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
  Widget _verificationcompleted() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 300,
              bottom: 60,
              right: 28,
              left: 28,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/verification_icon.png',
                  height: 133,
                  width: 126,
                ),
                SizedBox(height: 60.h),
                Text(
                  'Verification Success',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: const EdgeInsets.only(left: 33, right: 33),
                  child: Text(
                    'Congratulations, your account has been verified',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      wordSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Spacer(),
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
                      child: Text('Continue', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _verifylogin();
  }
}
