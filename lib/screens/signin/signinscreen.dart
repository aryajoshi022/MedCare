import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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

  String selectedCode = 'Pilih'; // 'Pilih' means 'Select' in Indonesian
  final List<String> codes = ['Pilih', '+62', '+91', '+44'];
  final TextEditingController _controller = TextEditingController();

  Widget _buildToggleTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_tabButton("Phone No", 0), _tabButton("Email", 1)],
    );
  }

  Widget _tabButton(String title, int index) {
    bool isActive = _currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _switchPage(index),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppColors.btnPrimary : AppColors.borderThirsty,
                width: 2.w,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.khula(
              color: isActive ? AppColors.btnPrimary : AppColors.borderSecondary,
              fontWeight: FontWeight.bold,
            ),
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
      appBar: AppBar(
        backgroundColor: AppColors.bgAlert,
        leading:Padding(
          padding: EdgeInsets.all(20.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.chevron_left, weight: 7),
            ),
          ),
        ), ),

      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 28.w,right: 28.w,bottom: 60.h,top: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your phone number or email',
                style: GoogleFonts.khula(fontSize: 20.sp, fontWeight: FontWeight.w700),
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
          SizedBox(height: 26.h),
          Text(
            'Email',
            style: GoogleFonts.khula(fontSize: 16.sp, color: AppColors.btnPrimary,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          SizedBox(height: 44.h,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter phone email',
                hintStyle: GoogleFonts.khula(color: AppColors.textDisabled,fontSize: 14.sp,fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                ),
              ),
            ),
          ),
          SizedBox(height: 26.h),
          Text(
            'Is there an issue with your email?',
            style: GoogleFonts.khula(
              fontSize: 14.sp,
              color: AppColors.textBtn,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        // height: 118.h + MediaQuery.of(context).padding.bottom,
        color: AppColors.bgAlert,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 91.h,
              width: 372.w,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 20.h,
                  right: 10.w,
                  left: 10.w,
                ),
                child: ElevatedButton(
                  child: Text('Login', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => _verificationcompleted(),));
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have a MedCare Account yet ? ',
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignScreen(),));
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.khula(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.btnPrimary,
                    ),),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _nophonelogin() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 26.h),
          Text(
            'Phone No',
            style: GoogleFonts.khula(fontSize: 16.sp, color: AppColors.textBtn,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 44.h,
            child: Container(
              decoration:
              BoxDecoration(
                border: Border.all(color: AppColors.borderThirsty), // Black border
                borderRadius: BorderRadius.circular(4.r),  // Optional: Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButton<String>(
                    value: selectedCode,
                    dropdownColor: Colors.white,
                    style: TextStyle(color: AppColors.btnSecondary),
                    underline: SizedBox(),
                    icon: Icon(Icons.keyboard_arrow_down,color: AppColors.btnSecondary,size: 16.sp),
                    iconEnabledColor: AppColors.btnSecondary,
                    items: codes.map((String code) {
                      return DropdownMenuItem<String>(
                        value: code,
                        child: Text(
                          code,
                          style: GoogleFonts.khula(fontSize: 14.sp, color: AppColors.textSecondary),
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
                    child: SizedBox(height: 44.h,
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'Enter phone number',maintainHintHeight: true,
                          hintStyle: GoogleFonts.khula(color: AppColors.textDisabled,fontSize: 14.sp,fontWeight: FontWeight.w400),
                          border: InputBorder.none,isDense: true
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 26.h),
          Text(
            'Is there an issue with your phone number?',
            style: GoogleFonts.khula(
              fontSize: 14.sp,
              color: AppColors.textBtn,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        // height: 118.h + MediaQuery.of(context).padding.bottom,
        color: AppColors.bgAlert,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => _verificationcompleted(),));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.btnPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Text('Login', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have a MedCare Account yet ? ',
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignScreen(),));

                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.khula(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.btnPrimary,
                    ),),
                )


              ],
            ),
          ],
        ),
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
                  height: 160.h,
                  width: 160.w,
                ),
                SizedBox(height: 60.h),
                Text(
                  'Verification Success',
                  style: GoogleFonts.khula(
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
                    style: GoogleFonts.khula(
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
                      child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
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
