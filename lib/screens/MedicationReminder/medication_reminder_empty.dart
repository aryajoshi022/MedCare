import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/MedicationReminder/drug_details.dart';
import 'package:medcare/screens/MedicationReminder/medication_reminder.dart';

import '../../util/constants/colors.dart';

class MedicationReminderEmpty extends StatefulWidget {
  const MedicationReminderEmpty({super.key});

  @override
  State<MedicationReminderEmpty> createState() => _MedicationReminderEmptyState();
}

class _MedicationReminderEmptyState extends State<MedicationReminderEmpty> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCustomAppBar(),
              // SizedBox(height: 24.h),
              _buildWeekList(),
              SizedBox(height: 40.h),
              Text('Today, 20 February 2024',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: AppColors.textSecondary
                ),
              ),
              SizedBox(height: 140.h),
              _buildNoSchedule(),
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
                    borderRadius: BorderRadius.circular(24.w)
                ),
                // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h)
                padding: EdgeInsets.only(left: 10)
              // side: BorderSide(
              //   width: 1,
              //   color: Color(0xff26408B),
              // ),
            ),
            child: Text('Add Medicine',
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  // letterSpacing: 1,
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
                color: AppColors.btnSecondary
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicationReminder()));
            },
          ),
          Spacer(flex: 2,),
          Text(
            'Medication Reminder',
            style: GoogleFonts.khula(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 1,
                color: AppColors.textNormal
            ),
          ),
          Spacer(flex: 3,)
        ],
      ),
    );
  }

  Widget _buildWeekList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: AppColors.btnSecondary,
                    size: 16,
                  ),
                  onPressed: () {},
                ),
                Text('February',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 1,
                    color: AppColors.textSecondary
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    color: AppColors.btnSecondary,
                    size: 16,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          _buildScheduleDays(context),
        ],
      ),
    );
  }

  Widget _buildScheduleDays(BuildContext context) {
    final days = ['Wed\n22', 'Thu\n23', 'Fri\n24', 'Sat\n25', 'Sun\n26', 'Mon\n27'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: days.map((day) {
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                border: Border.all(width: 1, color: AppColors.borderBtn),
                color: isSelected? AppColors.btnPrimary : AppColors.bgAlert
              // border: isSelected ? Border.all(color: Color(0xffE3E3E3)) : null,
            ),
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: isSelected ? AppColors.textWhite : AppColors.textSecondary
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNoSchedule() {
    return Column(
      children: [
        Image.asset('assets/images/MedicationSchedule.png',
          width: 160.w,
          height: 160.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 20.h),
        Text('No medication scheduled for today',
          style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 1,
              color: AppColors.textNormal
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text('Click add medicine below to add a schedule',
          style: GoogleFonts.khula(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 1,
              color: AppColors.textSecondary
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

}
