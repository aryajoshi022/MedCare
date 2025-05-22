import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/profile/profile_screen.dart';

import '../../util/constants/colors.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: AppColors.textBtn
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24,
            ),
          ),
          Spacer(flex: 2),
          Text('Account Setting',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.textNormal,
              letterSpacing: 1,
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }

}
