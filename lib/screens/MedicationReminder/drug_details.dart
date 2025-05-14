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
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    SizedBox(height: 24.h),
                    _buildActivateNotificationsSection(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 28.w,
            right: 28.w,
            bottom: 40.w,
            top: 24.h
        ),
        child: Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bgPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.w)
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h)
            ),
            child: Text('Save',
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 1,
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
          Column(
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
              SizedBox(height: 14.h),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(40.w),
                  border: Border.all(color: AppColors.borderBtn, width: 1),
                  color: AppColors.bgAlert
                ),
                padding: EdgeInsets.all(18.w),
                child: IconButton(
                  onPressed: (){},
                  icon: Image.asset(
                    'assets/icons/Camera_Linear.png',
                    width: 44.w,
                    height: 44.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
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
            padding: EdgeInsets.only(left: 14.w),
            // padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
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
                    color: AppColors.btnSecondary,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text('Period of Taking Medicine',
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
          SizedBox(height: 24.h),
          Text('How Many Times a Day',
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
          SizedBox(height: 24.h),
          Text('Time to Take Medicine',
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

  Widget _buildActivateNotificationsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(
          width: 1,
          color: AppColors.borderThirsty,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/cart.png',
                height: 24.h,
                color: AppColors.bgPrimary,
              ),
              SizedBox(width: 8.w),
              Text('Activate notifications',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppColors.textSecondary
                ),),
            ],
          ),
          Switch(
            value: _notificationsEnabled,
            activeColor: AppColors.btnGrey,
            activeTrackColor: AppColors.btnPrimary,// Replace with actual state
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
              // Handle switch state change
            },
          ),
        ],
      ),
    );
  }

}