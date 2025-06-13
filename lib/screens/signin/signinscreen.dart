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

  String selectedCode = '+91'; // 'Pilih' means 'Select' in Indonesian
  final List<String> codes = ['Pilih', '+62', '+91', '+44'];
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

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
                          child: Text('Login', style: GoogleFonts.khula(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textWhite)),
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
                                  MaterialPageRoute(builder: (context) => _verificationcompleted()));
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
                                controller: _controller,
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
                          onPressed: () async{
                            // if (_formKey2.currentState!.validate()) {
                            //   // If the email is valid, navigate to signup OTP screen
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => _verificationcompleted()),
                            //   );
                            // }
                            // else {
                            //   // If form is invalid, stay on page and show validation error
                            //   print('Form is invalid');
                            //   }
                            final phone = "$selectedCode${_phoneNoController.text.trim()}";
                            if (phone.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Center(child: Text('Please enter your Phone Number',style: GoogleFonts.khula()))),
                              );
                              return;
                            }

                            bool exists = await FirebaseServices.loginWithPhone(phone);

                            if (exists) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => _verificationcompleted()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Center(child: Text('Phone Number not found. Please Sign Up.',style: GoogleFonts.khula()))),
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
