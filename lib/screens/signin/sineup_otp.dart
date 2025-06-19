import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../FirebaseServices/firebase_services.dart';
import '../../util/constants/colors.dart';
import '../home/home_screen.dart';

class SignupOtp extends StatefulWidget {
  final String email;

  const SignupOtp({super.key, required this.email});

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: LayoutBuilder(builder: (context, constraints) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.chevron_left, size: 24.sp, color: AppColors.btnArrow),
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
                  Padding(
                    padding: EdgeInsets.all(18.w),
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
                    widget.email, // show actual email here
                    style: GoogleFonts.khula(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBtn,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 91.h,
                    width: 372.w,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                      child: ElevatedButton(
                        child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp)),
                        onPressed: () async {
                          String password = _passwordController.text.trim();
                          if (password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please enter a password')),
                            );
                            return;
                          }

                          bool isCorrect = await FirebaseServices.checkPassword(widget.email, password);

                          if (isCorrect) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _verificationcompleted()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Incorrect password')),
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
                  ),
                  Text(
                    'Resend in 60 seconds',
                    style: GoogleFonts.khula(
                      color: AppColors.textDisabled,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
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

}
