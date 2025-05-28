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

  String selectedCode = 'Pilih'; // 'Pilih' means 'Select' in Indonesian
  final List<String> codes = ['Pilih', '+62', '+91', '+44'];
  final TextEditingController _controller = TextEditingController();


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
        margin: EdgeInsets.symmetric(horizontal: 30),
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
                    padding:  EdgeInsets.all(2.0.w),
                    child: SizedBox(
                      height: 3.h,
                      width: 80.w,
                      child: LinearProgressIndicator(
                        value: 200 / 400, //current / max
                        backgroundColor: AppColors.borderThirsty,
                        color: AppColors.bgPrimary,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Text('Phone Number*', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(
              height: 44,
              child: Container(
                decoration:
                BoxDecoration(
                  border: Border.all(color: AppColors.borderThirsty), // Black border
                  borderRadius: BorderRadius.circular(4),  // Optional: Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedCode,
                      dropdownColor: Colors.white,
                      style: TextStyle(color: Colors.black),
                      underline: SizedBox(),

                      iconEnabledColor: Colors.black,
                      items: codes.map((String code) {
                        return DropdownMenuItem<String>(
                          value: code,
                          child: Text(
                            code,
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCode = newValue!;
                        });
                      },
                    ),
                    VerticalDivider(color: AppColors.textDisabled),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: AppColors.textDisabled),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Enter phone number',
                          hintStyle: TextStyle(color: AppColors.textDisabled),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Full Name', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 44.h,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0,bottom: 0,right: 15,left: 10),
                  hintText: 'Enter your full name',
                    hintStyle: TextStyle(color: AppColors.textDisabled,fontSize: 14,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),

                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Gender', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),
            
            SizedBox(height: 44,
              child: DropdownButtonFormField<String>(

                hint: Text('Choose your gender',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),),
                items: [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                dropdownColor: Colors.white,

                onChanged: (value) {},
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Date of Birth', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 45.h,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today_outlined,color: AppColors.textSecondary,),
                  hintText: 'Enter your date of birth',
                  hintStyle: TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Row(mainAxisAlignment: MainAxisAlignment.start,
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
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 51.h,
              width: 372.w,

              child: Padding(
                padding:  EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                ),
                child: ElevatedButton(
                  child: Text('Register', style: TextStyle(fontSize: 16.sp)),
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
                      borderRadius: BorderRadius.circular(24.r),
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
                    padding:  EdgeInsets.all(2.0.w),
                    child: SizedBox(
                      height: 3.h,
                      width: 80.w,
                      child: LinearProgressIndicator(
                        value: 200 / 400, //current / max
                        backgroundColor: AppColors.bgPrimary,
                        color: AppColors.borderThirsty,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Text('Email', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 48.h,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(color: AppColors.textDisabled),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),

                  border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderSecondary)),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Full Name', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 44.h,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0,bottom: 0,right: 15,left: 10),
                  hintText: 'Enter your full name',
                  hintStyle: TextStyle(color: AppColors.textDisabled,fontSize: 14,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),

                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Gender', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),

            SizedBox(height: 44,
              child: DropdownButtonFormField<String>(

                hint: Text('Choose your gender',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),),
                items: [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                dropdownColor: Colors.white,

                onChanged: (value) {},
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Date of Birth', style: TextStyle(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 45.h,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today_outlined,color: AppColors.textSecondary,),
                  hintText: 'Enter your date of birth',
                  hintStyle: TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 26.h),
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
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 51.h,
              width: 372.w,

              child: Padding(
                padding:  EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                ),
                child: ElevatedButton(
                  child: Text('Register', style: TextStyle(fontSize: 16.sp)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => _signupotp()),
                    );
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
          padding:  EdgeInsets.all(28.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, weight: 7.w),
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16.sp,
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
                    padding:  EdgeInsets.all(18.0.w),
                    child: Text(textAlign: TextAlign.center,
                      'Enter the 4-digit verification code (OTP) sent to your phone',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '(+66) 6152 625 612',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBtn,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 91.h,
                    width: 372.w,

                    child: Padding(
                      padding:  EdgeInsets.only(
                        top: 20.h,
                        bottom: 20.h,
                        right: 10.w,
                        left: 10.w,
                      ),
                      child: ElevatedButton(
                        child: Text('Continue', style: TextStyle(fontSize: 16.sp)),
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
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('Resend in 60 seconds',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColors.textDisabled),),
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
          padding:  EdgeInsets.all(28.w),
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
                      fontSize: 16.sp,
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
                    padding:  EdgeInsets.all(18.0.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Enter the 4-digit verification code (OTP) sent to your email',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    'info@gmail.com',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBtn,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                      _buildPinBox(),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 91.h,
                    width: 372.w,

                    child: Padding(
                      padding:  EdgeInsets.only(
                        top: 20.h,
                        bottom: 20.h,
                        right: 10.w,
                        left: 10.w,
                      ),
                      child: ElevatedButton(
                        child: Text('Continue', style: TextStyle(fontSize: 16.sp)),
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
                            borderRadius: BorderRadius.circular(24.r),
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
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgPrimary),
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Text(
        '7', // Placeholder for input
        style: TextStyle(fontSize: 24.sp),
      ),
    );
  }



  Widget _verificationcompleted() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.only(
              top: 300.h,
              bottom: 60.h,
              right: 28.w,
              left: 28.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/verification_icon.png',
                  height: 133.h,
                  width: 126.w,
                ),
                SizedBox(height: 60.h),
                Text(
                  'Verification Success',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding:  EdgeInsets.only(left: 33.w, right: 33.w),
                  child: Text(textAlign: TextAlign.center,
                    'Congratulations, your account has been verified',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textSecondary,
                      wordSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 91.h,
                  width: 372.w,

                  child: Padding(
                    padding:  EdgeInsets.only(
                      top: 20.h,
                      bottom: 20.h,
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: ElevatedButton(
                      child: Text('Continue', style: TextStyle(fontSize: 16.sp)),
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
                          borderRadius: BorderRadius.circular(24.r),
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
      appBar: AppBar(
        backgroundColor: AppColors.bgAlert,
        leading:Padding(
          padding: const EdgeInsets.all(20),
          child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left,
               weight: 7),
                ),
        ), ),
      body: Padding(
        padding:  EdgeInsets.only(left: 28.w,right: 28.w,top: 24.h,bottom:50.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete Personal Identification',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12.w),
              Text(
                'You can connect with all healthcare facilities you`ve previously visited.',
                style: TextStyle(
                  fontSize: 14.sp,
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
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),

                      GestureDetector(
                        onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));},

                        child: Text(
                        'Click here to log in',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.btnPrimary,
                        ),),
                      ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
