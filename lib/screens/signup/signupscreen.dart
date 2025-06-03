import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppColors.btnPrimary : Colors.transparent,
                width: 2,
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

  Widget _signInPage() {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26.h),
            Text('Phone No*', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(
              height: 40,
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
                      style: TextStyle(color: AppColors.btnSecondary),
                      underline: SizedBox(),
                      icon: Icon(Icons.keyboard_arrow_down,color: AppColors.btnSecondary,size: 16.sp),
                      iconEnabledColor: AppColors.btnSecondary,
                      items: codes.map((String code) {
                        return DropdownMenuItem<String>(
                          value: code,
                          child: Text(
                            code,
                            style: GoogleFonts.khula(fontSize: 14.sp),
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
                            contentPadding: EdgeInsets.only(top: 0,bottom: 10,right: 15,left: 10),
                            hintText: 'Enter phone number',
                            hintStyle: GoogleFonts.khula(color: AppColors.textDisabled,fontSize: 14.sp,fontWeight: FontWeight.w400),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Full Name', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 44.h,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0,bottom: 0,right: 15,left: 10),
                  hintText: 'Enter your full name',
                    hintStyle: GoogleFonts.khula(color: AppColors.textDisabled,fontSize: 14.sp,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),

                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Gender', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),
            
            SizedBox(height: 44.h,
              child: DropdownButtonFormField<String>(
                icon: Icon(Icons.keyboard_arrow_down,color: AppColors.btnSecondary, size: 16.sp),
                padding: EdgeInsets.only(right: 14.w),
                hint: Text('Choose your gender',style: GoogleFonts.khula(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),),
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
                    contentPadding: EdgeInsets.only(left: 10.w),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Date of Birth', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 45.h,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Image.asset('assets/icons/calender_icon.png',color: AppColors.textSecondary,width: 16.w,height: 16.h,) ,
                  hintText: 'Enter your date of birth',
                  contentPadding: EdgeInsets.only(left: 10.w),
                  hintStyle: GoogleFonts.khula(color: AppColors.textSecondary,fontSize: 14.sp,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(height: 24,
                  width: 24,
                  child: Checkbox(

                    tristate: true, // Example with tristate
                    side: BorderSide(color: AppColors.borderSecondary),
                    value: value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 18.h,left: 16.w),
                    child: Text(
                      textAlign: TextAlign.start,
                      'You agree to receive information and notifications sent by MedCare.',
                      style: GoogleFonts.khula(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 40.h,
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
                  child: Text('Register', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700,color: AppColors.textWhite)),
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
            SizedBox(height: 26.h),
            Text('Email', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 44.h,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0,bottom: 0,right: 15,left: 10),
                  hintText: 'Enter email',
                  hintStyle: GoogleFonts.khula(color: AppColors.textDisabled,fontSize: 14.sp,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),

                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Full Name', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 44.h,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0,bottom: 0,right: 15,left: 10),
                  hintText: 'Enter your full name',
                  hintStyle: GoogleFonts.khula(color: AppColors.textDisabled,fontSize: 14.sp, fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),

                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Gender', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),

            SizedBox(height: 44,
              child: DropdownButtonFormField<String>(
                icon: Icon(Icons.keyboard_arrow_down,color: AppColors.btnSecondary, size: 16.sp,),
                padding: EdgeInsets.only(right: 14.w),
                hint: Text('Choose your gender',style: GoogleFonts.khula(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),),
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
                    contentPadding: EdgeInsets.only(left: 10.w),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 26.h),
            Text('Date of Birth', style: GoogleFonts.khula(fontSize: 16.sp,color: AppColors.btnPrimary)),
            SizedBox(height: 45.h,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Image.asset('assets/icons/calender_icon.png',color: AppColors.textSecondary,height: 16.h, width: 16.w,) ,
                  hintText: 'Enter your date of birth',
                  contentPadding: EdgeInsets.only(left: 10.w),
                  hintStyle: GoogleFonts.khula(color: AppColors.textSecondary,fontSize: 14.sp,fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderSecondary), // Red border when not focused
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(height: 24.h,
                  width: 24.w,
                  child: Checkbox(
                    tristate: true, // Example with tristate
                    side: BorderSide(color: AppColors.borderSecondary),
                    value: value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18,left: 16),
                    child: Text(
                      textAlign: TextAlign.start,
                      'You agree to receive information and notifications sent by MedCare.',
                      style: GoogleFonts.khula(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.textSecondary),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
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
                  child: Text('Register', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
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
          padding:  EdgeInsets.only(left:28.w,right: 28.w,top: 24.w),
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
                    icon: Icon(Icons.chevron_left,
                        weight: 7,
                    color: AppColors.btnArrow),
                  ),
                  Text(
                    'Register',
                    style: GoogleFonts.khula(
                      color: AppColors.textNormal,
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
                    padding:  EdgeInsets.all(18.w),
                    child: Text(textAlign: TextAlign.center,
                      'Enter the 4-digit verification code (OTP) sent to your phone',
                      style: GoogleFonts.khula(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '(+66) 6152 625 612',
                    style: GoogleFonts.khula(
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
                        child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp)),
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
                  Text('Resend in 60 seconds',style: GoogleFonts.khula(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColors.textDisabled),),
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
          padding:  EdgeInsets.only(left:28.w,right: 28.w,top: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left,
                      weight: 7,
                      color: AppColors.btnArrow,),
                  ),
                  Text(
                    'Register',
                    style: GoogleFonts.khula(
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
                    padding:  EdgeInsets.all(18.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Enter the 4-digit verification code (OTP) sent to your email',
                      style: GoogleFonts.khula(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    'info@gmail.com',
                    style: GoogleFonts.khula(
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
                        child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp)),
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
                  Text('Resend in 60 seconds',style: GoogleFonts.khula(color: AppColors.textDisabled,fontWeight: FontWeight.w400,fontSize: 16.sp),),
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
        style: GoogleFonts.khula(fontSize: 24.sp),
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
                      child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp)),
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
          padding: const EdgeInsets.all(10),
          child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left,
               weight: 7),
                ),
        ), ),
      body: Padding(
        padding:  EdgeInsets.only(left: 28.w,right: 28.w,top: 22.h,bottom:50.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete Personal Identification',
                style: GoogleFonts.khula(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12.w),
              Text(
                'You can connect with all healthcare facilities you`ve previously visited.',
                style: GoogleFonts.khula(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 30.h),

              _buildToggleTabs(),
              Expanded(
                child: Center(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged:
                        (index) => setState(() => _currentIndex = index),
                    children: [_signInPage(), _signUpPage()],
                  ),
                ),
              ),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: GoogleFonts.khula(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),

                      GestureDetector(
                        onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));},

                        child: Text(
                        'Click here to log in',
                        style: GoogleFonts.khula(
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
