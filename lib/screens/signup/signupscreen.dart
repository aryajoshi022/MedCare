import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/screens/signin/signinscreen.dart';
import 'package:medcare/util/constants/colors.dart';

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
          //color: isActive ? AppColors.btnPrimary : Colors.grey.shade300,
          //borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.btnPrimary : AppColors.borderSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _signInPage() {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
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
            Text('No Phone*', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            SizedBox(height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                    hintStyle: TextStyle(color: AppColors.textDisabled,),
                  border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderSecondary)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Full Name', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            SizedBox(height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                    hintStyle: TextStyle(color: AppColors.textDisabled),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Gender', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            
            SizedBox(height: 52,
              child: DropdownButtonFormField<String>(
                hint: Text('Choose your gender',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textSecondary),),
                items: [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                dropdownColor: Colors.white,
                onChanged: (value) {},
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 10),
            Text('Date of Birth', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            SizedBox(height: 45,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today_outlined,color: AppColors.textSecondary,),
                  hintText: 'Enter your date of birth',
                    hintStyle: TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  tristate: true, // Example with tristate
                  side: BorderSide(color: AppColors.borderSecondary),
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
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textSecondary),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => _signInotp()),
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
    );
  }

  Widget _signUpPage() {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
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
            Text('Email', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            SizedBox(height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(color: AppColors.textDisabled),
                  border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderSecondary)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Full Name', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            SizedBox(height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                    hintStyle: TextStyle(color: AppColors.textDisabled),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Gender', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            SizedBox(height: 52,
              child: DropdownButtonFormField<String>(
                 hint: Text('Choose your gender',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textSecondary),),
                items: [
                  DropdownMenuItem(value: 'Male', child: Text('Male',)),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                dropdownColor: Colors.white,
                onChanged: (value) {},
                decoration: InputDecoration(border: OutlineInputBorder(),filled: true,fillColor: Colors.white,),
              ),
            ),
            SizedBox(height: 10),
            Text('Date of Birth', style: TextStyle(fontSize: 16,color: AppColors.btnPrimary)),
            SizedBox(height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your date of birth',
                  hintStyle: TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w400),
                  suffixIcon: Icon(Icons.calendar_today_outlined,),
                  border: OutlineInputBorder( borderSide: BorderSide(color: AppColors.borderSecondary)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  tristate: true, // Example with tristate
                  value: value,side: BorderSide(color: AppColors.borderSecondary),
                  onChanged: (bool? newValue) {
                    setState(() {
                      value = newValue;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'You agree to receive information and notifications sent by MedCare.',
                    style: TextStyle(fontSize: 14,color: AppColors.textSecondary,fontWeight: FontWeight.w400),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (_signupotp())),
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
    );
  }

  //Otp Verification Screens
  Widget _signInotp() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, weight: 7),
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 145.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Enter the 4-digit verification code (OTP) sent to your phone',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '(+66) 6152 625 612',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBtn,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                    ],
                  ),
                  SizedBox(height: 40),
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
                            MaterialPageRoute(
                              builder: (context) => _verificationcompleted(),
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
                  Text('Resend in 60 seconds',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.textDisabled),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupotp() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, weight: 7),
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 145.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Enter the 4-digit verification code (OTP) sent to your email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    'info@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBtn,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                    ],
                  ),
                  SizedBox(height: 40),
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
                            MaterialPageRoute(
                              builder: (context) => _verificationcompleted(),
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
                  Text('Resend in 60 seconds',style: TextStyle(color: AppColors.textDisabled,fontWeight: FontWeight.w400,fontSize: 16),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //For Otp verification Box
  Widget _buildPinBox() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgPrimary),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '7', // Placeholder for input
        style: TextStyle(fontSize: 24),
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 23,right: 23,top: 24,bottom:50),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));},
                     child: Text(
                      'Click here to log in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.btnPrimary,
                      ),),
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
