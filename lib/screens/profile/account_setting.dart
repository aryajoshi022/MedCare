import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/profile/profile_screen.dart';

import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      letterSpacing: 0.sp,
                      color: AppColors.textBtn
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      hintText: 'Enter your password',
                      hintStyle: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textDisabled
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        borderSide: BorderSide(width: 1.w, color: AppColors.borderSecondary)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        borderSide: BorderSide(width: 1.w, color: AppColors.borderSecondary)
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text('Language',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        letterSpacing: 0.sp,
                        color: AppColors.textBtn
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(width: 1.w, color: AppColors.borderSecondary),
                    ),
                    padding: EdgeInsets.only(left: 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('English',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textNormal
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.keyboard_arrow_down,
                            size: 16.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text('Privacy Settings',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      letterSpacing: 0.sp,
                      color: AppColors.textBtn
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(width: 1.w, color: AppColors.borderSecondary),
                    ),
                    padding: EdgeInsets.only(left: 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Information privacy',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textNormal
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.chevron_right,
                            size: 16.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        children: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24.sp,
            ),
          ),
          Spacer(flex: 2),
          Text('Account Setting',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.textNormal,
              letterSpacing: 1.sp,
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }

}
