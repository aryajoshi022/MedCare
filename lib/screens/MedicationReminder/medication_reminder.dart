import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/MedicationReminder/medication_reminder_empty.dart';
import 'package:medcare/screens/services/services_screen.dart';
import 'package:medcare/util/constants/colors.dart';

import 'drug_details.dart';

class MedicationReminder extends StatefulWidget {
  const MedicationReminder({super.key});

  @override
  State<MedicationReminder> createState() => _MedicationReminderState();
}

class _MedicationReminderState extends State<MedicationReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCustomAppBar(),
              _buildReminderOfMedicine(),
              SizedBox(height: 24.h),
              _buildHistoryOfMedicine(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 28.w,
          right: 28.w,
          bottom: 40.w,
          top: 14.h
        ),
        child: Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DrugDetails(),));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bgPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r)
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h)
            ),
            child: Text('Add Medicine',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                letterSpacing: 1.sp,
                color: AppColors.textWhite
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24.sp,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesScreenScreen()));
            },
          ),
          Spacer(flex: 2),
          Text(
            'Medication Reminder',
            style: GoogleFonts.khula(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                letterSpacing: 1.sp,
                color: AppColors.textNormal
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }

  Widget _buildReminderOfMedicine() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 201.w,
                child: Text('Reminder to Take Medicine',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textSecondary
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MedicationReminderEmpty()));
                },
                child: Text('Lihat Semua  >',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.textBtn
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.only(left: 50.w, top: 39.h, right: 49.w, bottom: 38.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: 1.w,
                color: AppColors.borderThirsty,
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/MedicationReminder.png',
                  width: 132.72.w,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16.h),
                Text('Manage your medication',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textNormal
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Text('Add the medicine you are taking and create a reminder to take the medicine',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textSecondary
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryOfMedicine() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('History of Taking Medication',
            style: GoogleFonts.khula(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                letterSpacing: 1.sp,
                color: AppColors.textSecondary
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.only(left: 50.w, top: 39.h, right: 49.w, bottom: 38.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: 1.w,
                color: AppColors.borderThirsty,
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/MedicationReminder.png',
                  width: 132.72.w,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16.h),
                Text('View all your medication history',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textNormal
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Text('Add the medicine you are taking and create a reminder to take the medicine',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textSecondary
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
