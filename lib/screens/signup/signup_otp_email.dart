import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../FirebaseServices/firebase_services.dart';
import '../../util/constants/colors.dart';
import '../signin/signinscreen.dart';

class SignupOtpScreen extends StatelessWidget {
  final String email;
  final String name;
  final String gender;
  final String dob;

  final TextEditingController _passwordController = TextEditingController();

  SignupOtpScreen({
    required this.email,
    required this.name,
    required this.gender,
    required this.dob,
    Key? key,
  }) : super(key: key);

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
                        icon: Icon(
                          Icons.chevron_left,
                          size: 24.sp,
                          color: AppColors.btnArrow,
                        ),
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
                        email,
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
                          padding: EdgeInsets.only(
                            top: 20.h,
                            bottom: 20.h,
                            right: 10.w,
                            left: 10.w,
                          ),
                          child: ElevatedButton(
                            child: Text('Continue',
                                style: GoogleFonts.khula(fontSize: 16.sp)),
                            onPressed: () async {
                              String password = _passwordController.text.trim();
                              if (password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Please enter a password')),
                                );
                                return;
                              }

                              // Save to Firebase
                              bool registered =
                              await FirebaseServices.registerUserWithEmail(
                                email: email,
                                name: name,
                                gender: gender,
                                dob: dob,
                                password: password,
                              );

                              if (registered) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('User already exists'),
                                  ),
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
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
