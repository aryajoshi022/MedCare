import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/MedicationReminder/medication_reminder.dart';

import '../../util/constants/colors.dart';

class DrugDetails extends StatefulWidget {
  const DrugDetails({super.key});

  @override
  State<DrugDetails> createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.w),
                      border: Border.all(color: AppColors.borderBtn, width: 1),
                      color: AppColors.borderThirsty
                    ),
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Paracetamol 500 mg',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1,
                              color: AppColors.textNormal
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text('Take 1 tablet every 6 hours as needed to reduce fever or pain.',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 1,
                              color: AppColors.textSecondary
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  _buildMedicineDetails(),
                ],
              ),
            ),
          ],
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
          Spacer(flex: 2),
          Text(
            'Details about the drug',
            style: GoogleFonts.khula(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 1,
                color: AppColors.textNormal
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }

  Widget _buildMedicineDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(color: AppColors.borderBtn, width: 1),
          color: AppColors.bgAlert
      ),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medicine Details',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 1,
                      color: AppColors.textNormal
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.w),
                    border: Border.all(color: AppColors.borderBtn, width: 1),
                    color: AppColors.bgAlert
                  ),
                  padding: EdgeInsets.all(18.w),
                  child: Image.asset(
                    'assets/icons/Camera_Linear.png',
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text('Dosage',
            style: GoogleFonts.khula(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 1,
                color: AppColors.textNormal
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              border: Border.all(width: 1, color: AppColors.borderSecondary)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Choose',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      // letterSpacing: 1,
                      color: AppColors.textDisabled
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.keyboard_arrow_down,
                    color: Color(0xff4D4D4D),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
