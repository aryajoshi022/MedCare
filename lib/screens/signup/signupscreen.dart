import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/screens/signin/signinscreen.dart';
import 'package:medcare/util/constants/colors.dart';
import '../../FirebaseServices/firebase_services.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  bool value = false;

  String selectedCode = '+91';
  final List<String> codes = ['Pilih', '+62', '+91', '+44'];
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedGender;



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
          padding: EdgeInsets.symmetric(vertical: 10.h),
          alignment: Alignment.center,

          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppColors.btnPrimary : AppColors.borderThirsty,
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
        child: Form(
          key: _formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26.h),
              Text('Phone No*', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
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
              Text('Full Name', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
              FormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          controller: _nameController,
                          textAlign: TextAlign.start,
                          onChanged: (val) {
                            field.didChange(val);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 0, bottom: 0, right: 15, left: 10),
                            hintText: 'Enter your full name',
                            hintStyle: GoogleFonts.khula(
                              color: AppColors.textDisabled,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors.borderSecondary,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors.borderSecondary,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                            ),
                          ),
                        ),
                      ),
                      if (field.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h, left: 4),
                          child: Text(
                            field.errorText!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 26.h),
              Text('Gender', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
              SizedBox(
                height: 44.h,
                child: DropdownButtonFormField<String>(
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  value: _selectedGender,
                  icon: Icon(Icons.keyboard_arrow_down, color: AppColors.btnSecondary, size: 16.sp),
                  padding: EdgeInsets.only(right: 14.w),
                  dropdownColor: Colors.white,
                  hint: Text(
                    'Choose your gender',
                    style: GoogleFonts.khula(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: 'Male', child: Text('Male',
                        style: GoogleFonts.khula(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary))),
                    DropdownMenuItem(value: 'Female', child: Text('Female',
                        style: GoogleFonts.khula(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary))),
                    DropdownMenuItem(value: 'Other', child: Text('Other',
                        style: GoogleFonts.khula(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary))),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.w),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Text('Date of Birth', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
              SizedBox(
                height: 45.h,
                child: TextFormField(
                  controller: _dobController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  readOnly: true,
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Image.asset(
                      'assets/icons/calender_icon.png',
                      color: AppColors.textSecondary,
                      height: 16.h,
                      width: 16.w,
                    ),
                    hintText: 'Enter your date of birth',
                    contentPadding: EdgeInsets.only(left: 10.w),
                    hintStyle: GoogleFonts.khula(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            textTheme: TextTheme(
                              bodyMedium: GoogleFonts.khula(),
                            ),
                            colorScheme: ColorScheme.light(
                              primary: AppColors.bgPrimary,
                              onPrimary: AppColors.bgAlert,
                              onSurface: AppColors.textNormal,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.textNormal,
                                textStyle: GoogleFonts.khula(),
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (date != null) {
                      _dobController.text = "${date.toLocal()}".split(' ')[0];
                    }
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(height: 24,
                    width: 24,
                    child: Checkbox(
                      activeColor: AppColors.bgPrimary,
                      checkColor: AppColors.bgAlert,
                      tristate: true, // Example with tristate
                      side: BorderSide(color: AppColors.borderSecondary),
                      value: value,
                      onChanged: (bool? newValue) {
                        setState(() {
                          value = newValue??false;
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
              SizedBox(height: 40.h,),
              SizedBox(
                height: 51.h,
                width: 372.w,
                child: Padding(
                  padding:  EdgeInsets.only(
                    right: 10.w,
                    left: 10.w,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_phoneNoController.text.isEmpty ||
                          _nameController.text.isEmpty ||
                          _selectedGender == null ||
                          _dobController.text.isEmpty ||
                          !value ) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                !value
                                    ? 'Please agree to the terms to continue'
                                    : 'Please fill all fields',
                                style: GoogleFonts.khula(),
                              ),
                            ),
                          ),
                        );
                      } else {
                        final phone = _phoneNoController.text.trim();

                        bool exists = await FirebaseServices.checkIfPhoneExists(phone);
                        if (exists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: Text(
                                  'Phone Number already registered!',
                                  style: GoogleFonts.khula(),
                                ),
                              ),
                            ),
                          );
                        } else {
                          await FirebaseServices.registerUserWithPhone(
                            phone: phone,
                            name: _nameController.text.trim(),
                            gender: _selectedGender!,
                            dob: _dobController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: Text(
                                  'Registered successfully!',
                                  style: GoogleFonts.khula(),
                                ),
                              ),
                            ),
                          );
                          Navigator.push(context,MaterialPageRoute(builder: (context) => _signInotp()));
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
                    child: Text('Register', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpPage() {
    return Scaffold(  resizeToAvoidBottomInset: true, // ensures layout resizes when keyboard shows
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26.h),
              Text('Email', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
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
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                            hintText: 'Enter email',
                            hintStyle: GoogleFonts.khula(
                              color: AppColors.textDisabled,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors.borderSecondary,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors.borderSecondary,
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
                            style: TextStyle(color: Colors.red, fontSize: 12.sp),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 26.h),
              Text('Full Name', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
              FormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          controller: _nameController,
                          textAlign: TextAlign.start,
                          onChanged: (val) {
                            field.didChange(val);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 0, bottom: 0, right: 15, left: 10),
                            hintText: 'Enter your full name',
                            hintStyle: GoogleFonts.khula(
                              color: AppColors.textDisabled,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors.borderSecondary,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: field.hasError ? Colors.red : AppColors.borderSecondary,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                            ),
                          ),
                        ),
                      ),
                      if (field.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h, left: 4),
                          child: Text(
                            field.errorText!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 26.h),
              Text('Gender', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
              SizedBox(
                height: 44.h,
                child: DropdownButtonFormField<String>(
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  value: _selectedGender,
                  icon: Icon(Icons.keyboard_arrow_down, color: AppColors.btnSecondary, size: 16.sp),
                  padding: EdgeInsets.only(right: 14.w),
                  dropdownColor: Colors.white,
                  hint: Text(
                    'Choose your gender',
                    style: GoogleFonts.khula(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: 'Male', child: Text('Male',
                        style: GoogleFonts.khula(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary))),
                    DropdownMenuItem(value: 'Female', child: Text('Female',
                        style: GoogleFonts.khula(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary))),
                    DropdownMenuItem(value: 'Other', child: Text('Other',
                        style: GoogleFonts.khula(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary))),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.w),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Text('Date of Birth', style: GoogleFonts.khula(fontWeight: FontWeight.w600, fontSize: 16.sp,color: AppColors.btnPrimary)),
              SizedBox(
                height: 45.h,
                child: TextFormField(
                  controller: _dobController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  readOnly: true,
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Image.asset(
                      'assets/icons/calender_icon.png',
                      color: AppColors.textSecondary,
                      height: 16.h,
                      width: 16.w,
                    ),
                    hintText: 'Enter your date of birth',
                    contentPadding: EdgeInsets.only(left: 10.w),
                    hintStyle: GoogleFonts.khula(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderSecondary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            textTheme: TextTheme(
                              bodyMedium: GoogleFonts.khula(),
                            ),
                            colorScheme: ColorScheme.light(
                              primary: AppColors.bgPrimary,
                              onPrimary: AppColors.bgAlert,
                              onSurface: AppColors.textNormal,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.textNormal,
                                textStyle: GoogleFonts.khula(),
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (date != null) {
                      _dobController.text = "${date.toLocal()}".split(' ')[0];
                    }
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(height: 24.h,
                    width: 24.w,
                    child: Checkbox(
                      checkColor: AppColors.bgAlert,
                      activeColor: AppColors.bgPrimary,
                      tristate: true, // Example with tristate
                      side: BorderSide(color: AppColors.borderSecondary),
                      value: value,
                      onChanged: (bool? newValue) {
                        setState(() {
                          value = newValue??false;
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
              SizedBox(height: 40.h,),
              SizedBox(
                height: 51.h,
                width: 372.w,

                child: Padding(
                  padding:  EdgeInsets.only(
                    right: 10.w,
                    left: 10.w,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_emailController.text.isEmpty ||
                          _nameController.text.isEmpty ||
                          _selectedGender == null ||
                          _dobController.text.isEmpty ||
                          !value ) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                !value
                                    ? 'Please agree to the terms to continue'
                                    : 'Please fill all fields',
                                style: GoogleFonts.khula(),
                              ),
                            ),
                          ),
                        );
                      } else {
                        final email = _emailController.text.trim();

                        // Check if the email already exists
                        final alreadyExists = await FirebaseServices.checkIfEmailExists(email);
                        if (alreadyExists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: Text(
                                  'Email already registered!',
                                  style: GoogleFonts.khula(),
                                ),
                              ),
                            ),
                          );
                        } else {
                          // Register if not already exists
                          FirebaseServices.registerUserWithEmail(
                            email: email,
                            name: _nameController.text.trim(),
                            gender: _selectedGender!,
                            dob: _dobController.text.trim(),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: Text(
                                  'Registered successfully!',
                                  style: GoogleFonts.khula(),
                                ),
                              ),
                            ),
                          );
                          Navigator.push(context,MaterialPageRoute(builder: (context) => _signupotp()));
                          // Optional: Clear fields or navigate
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
                    child: Text('Register', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Otp Verification Screens
  Widget _signInotp() {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ensures layout resizes when keyboard shows

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: LayoutBuilder(
            builder: (context, constraints) {
              return SafeArea(
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
                                size: 24.sp,
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
                              'Create a secure 4-digit password to complete your registration',
                              // 'Enter the 4-digit verification code (OTP) sent to your phone',
                              style: GoogleFonts.khula(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
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
                          SizedBox(height: 40.h),
                          _buildPasswordField(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: <Widget>[
                          //     _buildPinBox(context: context),
                          //     // _buildPinBox(context: context),
                          //     // _buildPinBox(context: context),
                          //     // _buildPinBox(context: context),
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
                                child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
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
                          // Text('Resend in 60 seconds',style: GoogleFonts.khula(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColors.textDisabled),),
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
  Widget _buildPasswordField() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        keyboardType: TextInputType.number,
        maxLength: 4,
        style: GoogleFonts.khula(fontSize: 16.sp, color: AppColors.textNormal),
        decoration: InputDecoration(
          counterText: '',
          hintText: 'Enter 4-digit password',
          hintStyle: GoogleFonts.khula(fontSize: 14.sp, color: AppColors.textDisabled),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderSecondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderSecondary),
          ),
        ),
      ),
    );
  }
  // Widget _buildPinBox({required BuildContext context}) {
  //   return Container(
  //
  //     width: 200,
  //     height: 50,
  //     margin: const EdgeInsets.symmetric(horizontal: 5),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: AppColors.borderSecondary),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     alignment: Alignment.center,
  //     child: TextField(
  //       controller: _passwordController,
  //       obscureText: true,
  //       keyboardType: TextInputType.number,
  //       maxLength: 4,
  //       decoration: InputDecoration(
  //         hintText: 'Enter 4-digit password',
  //         hintStyle: GoogleFonts.khula(fontSize: 14.sp, color: AppColors.textDisabled),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: AppColors.borderSecondary),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: AppColors.borderSecondary),
  //         ),
  //       ),
  //     ),
  //     // TextFormField(
  //     //   textAlign: TextAlign.center,
  //     //   keyboardType: TextInputType.number,
  //     //   maxLength: 1,
  //     //   style: GoogleFonts.khula(fontSize: 24),
  //     //   decoration: InputDecoration(
  //     //     counterText: '',
  //     //     border: InputBorder.none,
  //     //     contentPadding: EdgeInsets.zero,
  //     //   ),
  //     //   onChanged: (value) {
  //     //     if (value.isNotEmpty) {
  //     //       FocusScope.of(context).nextFocus(); // Auto move to next
  //     //     }
  //     //   },
  //     // ),
  //   );
  // }


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
                      child: Text('Continue', style: GoogleFonts.khula(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
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
          padding: EdgeInsets.all(10.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left,
                weight: 7),
          ),
        ), ),
      body: Padding(
        padding:  EdgeInsets.only(left: 28.w,right: 28.w,top: 22.h,bottom:60.h),
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
                'You can connect with all healthcare facilities you\'ve previously visited.',
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

              Padding(
                padding:  EdgeInsets.only(top: 16.h),
                child: Center(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
