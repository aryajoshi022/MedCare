import 'package:flutter/material.dart' show AnimatedContainer, BorderRadius, BoxDecoration, BuildContext, Checkbox, Colors, Column, CrossAxisAlignment, Curves, DropdownButtonFormField, DropdownMenuItem, EdgeInsets, ElevatedButton, Expanded, FontWeight, GestureDetector, Icon, IconButton, Icons, InputDecoration, MainAxisAlignment, Navigator, OutlineInputBorder, Padding, PageController, PageView, RoundedRectangleBorder, Row, SafeArea, Scaffold, SizedBox, State, StatefulWidget, Text, TextField, TextStyle, Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/util/constants/colors.dart';

import '../signin/signinscreen.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  bool? value = false;

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
          color: isActive ? AppColors.btnPrimary : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _signInPage() {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text('No Phone*', style: TextStyle(fontSize: 16)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter phone number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text('Full Name', style: TextStyle(fontSize: 16)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your full name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text('Gender', style: TextStyle(fontSize: 16)),
          DropdownButtonFormField<String>(
            items: [
              DropdownMenuItem(value: 'Male', child: Text('Male')),
              DropdownMenuItem(value: 'Female', child: Text('Female')),
              DropdownMenuItem(value: 'Other', child: Text('Other')),
            ],
            onChanged: (value) {},
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          Text('Date of Birth', style: TextStyle(fontSize: 16)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your date of birth',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                tristate: true, // Example with tristate
                value: value,
                onChanged: (bool? newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              ),
              Expanded(
                child: Text(
                  'You agree to receive information and notifications sent by MedCare.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
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
                child: Text('Register', style: TextStyle(fontSize: 16)),
                onPressed: () {},
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
    );
  }

  Widget _signUpPage() {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text('Email', style: TextStyle(fontSize: 16)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter phone number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text('Full Name', style: TextStyle(fontSize: 16)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your full name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text('Gender', style: TextStyle(fontSize: 16)),
          DropdownButtonFormField<String>(
            items: [
              DropdownMenuItem(value: 'Male', child: Text('Male')),
              DropdownMenuItem(value: 'Female', child: Text('Female')),
              DropdownMenuItem(value: 'Other', child: Text('Other')),
            ],
            onChanged: (value) {},
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          Text('Date of Birth', style: TextStyle(fontSize: 16)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your date of birth',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                tristate: true, // Example with tristate
                value: value,
                onChanged: (bool? newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              ),
              Expanded(
                child: Text(
                  'You agree to receive information and notifications sent by MedCare.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
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
                child: Text('Register', style: TextStyle(fontSize: 16)),
                onPressed: () {},
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, weight: 7),
              ),
              Text(
                'Complete Personal Identification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12.w),
              Text(
                'You can connect with all healthcare facilities you`ve previously visited.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 30.h),
              _buildToggleTabs(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged:
                      (index) => setState(() => _currentIndex = index),
                  children: [_signInPage(), _signUpPage()],
                ),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    'Click here to log in',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.btnPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
