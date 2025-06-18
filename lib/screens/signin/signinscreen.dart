import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/screens/signup/signupscreen.dart';

import '../../FirebaseServices/firebase_services.dart';
import '../../util/constants/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  String selectedCode = '+91';
  final List<String> codes = ['Pilih', '+62', '+91', '+44'];
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          padding: EdgeInsets.all(10.w),
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
          padding:  EdgeInsets.only(left: 28.w,right: 28.w,bottom: 75.h,top: 22.h),
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26.h),
              Text(
                'Email',
                style: GoogleFonts.khula(fontSize: 16.sp,
                    color: AppColors.btnPrimary,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12.h),
              FormField<String>(

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  // Basic email format validation using regex
                  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                builder: (FormFieldState<String> field) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 44.h,
                        child: TextFormField(
                          style: GoogleFonts.khula(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                          ),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            field.didChange(val);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w),
                            hintText: 'Enter email',
                            hintStyle: GoogleFonts.khula(
                              color: AppColors.textDisabled,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors
                                    .borderSecondary,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors
                                    .borderSecondary,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.borderSecondary,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (field.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h, left: 4.w),
                          child: Text(
                            field.errorText!,
                            style: TextStyle(
                                color: Colors.red, fontSize: 12.sp),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 26.h),
              GestureDetector(
                onTap: () =>
                    forgotPassword(context),
                child: Text(
                  'Is there an issue with your email?',
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    color: AppColors.textBtn,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(height: 360.h,),
              Container(
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
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            //   // If the email is valid, navigate to signup OTP screen
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) =>
                            //         _verificationcompleted()),
                            //   );
                            // }
                            // else {
                            //   // If form is invalid, stay on page and show validation error
                            //   print('Form is invalid');
                            // }
                            final email = _emailController.text.trim();
                            if (email.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Center(child: Text('Please enter your email',style: GoogleFonts.khula()))),
                              );
                              return;
                            }

                            bool exists = await FirebaseServices.loginWithEmail(email);

                            if (exists) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => _signupotp()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Center(child: Text('Email not found. Please Sign Up.',style: GoogleFonts.khula()))),
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
                          child: Text('Login', style: GoogleFonts.khula(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textWhite)),
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
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SignScreen(),));
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
            ],
          ),
        ),
      ),
    );
  }

  void Function() getForgotPasswordCallback(BuildContext context) {
    return () => forgotPassword(context);
  }

  void forgotPassword(BuildContext context) async {
    String email = _emailController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  Widget _nophonelogin() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26.h),
              Text(
                'Phone No',
                style: GoogleFonts.khula(fontSize: 16.sp, color: AppColors.textBtn,fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12.h),
              FormField<String>(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter phone number';
                  if (!RegExp(r'^\d+$').hasMatch(value)) return 'Only digits allowed';
                  if (value.length < 10) return 'Minimum 10 digits required';
                  return null;
                },
                builder: (field) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: field.hasError ? Colors.red : AppColors.borderThirsty),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              value: selectedCode,
                              underline: SizedBox(),
                              icon: Icon(Icons.keyboard_arrow_down, size: 16.sp, color: AppColors.btnSecondary),
                              style: GoogleFonts.khula(fontSize: 14.sp, color: AppColors.textSecondary),
                              items: codes.map((code) => DropdownMenuItem(value: code, child: Text(code))).toList(),
                              onChanged: (val) => setState(() => selectedCode = val!),
                            ),
                            VerticalDivider(color: AppColors.textDisabled),
                            Expanded(
                              child: TextField(
                                style: GoogleFonts.khula(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textSecondary,
                                ),
                                controller: _phoneNoController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                onChanged: field.didChange,
                                decoration: InputDecoration(
                                  hintText: 'Enter phone number',
                                  border: InputBorder.none,
                                  isDense: true,
                                  hintStyle: GoogleFonts.khula(
                                    color: AppColors.textDisabled,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (field.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h, left: 4.w),
                          child: Text(
                            field.errorText!,
                            style: TextStyle(color: Colors.red, fontSize: 12.sp),
                          ),
                        ),
                    ],
                  );
                },
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
              SizedBox(height: 360.h,),
              Container(
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
                          onPressed: () async {
                            final phone = "$selectedCode${_phoneNoController.text.trim()}";
                            if (phone.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Center(child: Text(
                                    'Please enter your Phone Number',
                                    style: GoogleFonts.khula()))),
                              );
                              return;
                            } else {
                              bool exists = await FirebaseServices.loginWithPhone(phone);

                              if (exists) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => _signInotp(phone: phone)),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Center(child: Text(
                                      'Phone Number not found. Please Sign Up.',
                                      style: GoogleFonts.khula()))),
                                );
                              }
                            }
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
                            ),
                          ),
                        )
                      ],
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

  Widget _signInotp({required String phone}) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.chevron_left, size: 24.sp, color: AppColors.btnArrow),
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.khula(
                        color: AppColors.textNormal,
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
                    'Enter your 4-digit password',
                    style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  'For number: $selectedCode ${_phoneNoController.text}',
                  // '(+66) 6152 625 612',
                  style: GoogleFonts.khula(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBtn,
                  ),
                ),
                SizedBox(height: 25.h),
                TextField(
                  controller: _passwordController,
                  maxLength: 4,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.khula(fontSize: 16.sp, color: AppColors.textNormal),
                  decoration: InputDecoration(
                    hintText: 'Enter 4-digit password',
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                    hintStyle: GoogleFonts.khula(fontSize: 14.sp, color: AppColors.textDisabled),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      String enteredPassword = _passwordController.text.trim();

                      if (enteredPassword.length != 4 || !RegExp(r'^\d{4}$').hasMatch(enteredPassword)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Center(child: Text("Enter a valid 4-digit password", style: GoogleFonts.khula()))),
                        );
                        return;
                      }

                      bool isValid = await FirebaseServices.verifyPhonePassword(
                        phone: phone,
                        password: enteredPassword,
                      );

                      if (isValid) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => _verificationcompleted()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Center(child: Text("Incorrect password", style: GoogleFonts.khula()))),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.btnPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
                    ),

                    child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp, color: AppColors.textWhite)),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    'Forgot your password?',
                    style: GoogleFonts.khula(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textDisabled,
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

  Widget _signupotp() {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ensures layout resizes when keyboard shows

      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: LayoutBuilder(
            builder:(context, constraints) {
              return SafeArea(
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
                              size: 24.sp,
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: <Widget>[
                          //     _buildPinBox(context: context),
                          //     _buildPinBox(context: context),
                          //     _buildPinBox(context: context),
                          //     _buildPinBox(context: context),
                          //
                          //   ],
                          // ),
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
              );
            }
        ),
      ),
    );
  }

  //For Otp verification Box
  // Widget _buildPinBox({required BuildContext context}) {
  //   return Container(
  //
  //     width: 50,
  //     height: 50,
  //     margin: const EdgeInsets.symmetric(horizontal: 5),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: AppColors.borderSecondary),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     alignment: Alignment.center,
  //     child: TextFormField(
  //       textAlign: TextAlign.center,
  //       keyboardType: TextInputType.number,
  //       maxLength: 1,
  //       style: GoogleFonts.khula(fontSize: 24),
  //       decoration: InputDecoration(
  //         counterText: '',
  //         border: InputBorder.none,
  //         contentPadding: EdgeInsets.zero,
  //       ),
  //       onChanged: (value) {
  //         if (value.isNotEmpty) {
  //           FocusScope.of(context).nextFocus(); // Auto move to next
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // Listen for changes in the text field
    _emailController.addListener(() {
      setState(() {
        // Rebuild whenever the text changes
      });
    });
  }

  @override
  void dispose() {
    // Always dispose controllers
    _emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return _verifylogin();
  }

}
