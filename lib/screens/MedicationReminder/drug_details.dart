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
  final List<String> dropdownLabels = [
    'Dosage',
    'Period of Taking Medicine',
    'How Many Times a Day',
    'Time to Take Medicine',
    'Drinking Rules',
    'Drinking Start Date',
    'Duration of Consumption',
  ];
  final Map<String, String?> selectedDropdownValues = {
    'Dosage': null,
    'Period of Taking Medicine': null,
    'How Many Times a Day': null,
    'Time to Take Medicine': null,
    'Drinking Rules': null,
    'Drinking Start Date': null,
    'Duration of Consumption': null,
  };
  final Map<String, List<String>> dropdownOptions = {
    'Dosage': ['2.0 Caplets'],
    'Period of Taking Medicine': ['Every Day'],
    'How Many Times a Day': ['2 Times'],
    'Time to Take Medicine': ['07.00, 12.00'],
    'Drinking Rules': ['After Meals'],
    'Drinking Start Date': ['Monday, February 19, 2024'],
    'Duration of Consumption': ['2 Weeks'],
  };

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
                    _buildDrugInfo(),
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
                // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h)
                padding: EdgeInsets.only(left: 10.w)
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

  Widget _buildDrugInfo() {
    return Container(
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
    );
  }

  Widget _buildMedicineDetails() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(color: AppColors.borderBtn, width: 1),
        color: AppColors.bgAlert,
      ),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Medicine Details',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 1,
              color: AppColors.textNormal,
            ),
          ),
          SizedBox(height: 14.h),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderSecondary, width: 1),
              color: AppColors.bgAlert,
            ),
            padding: EdgeInsets.all(18.w),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/Camera_Linear.png',
                width: 44.w,
                height: 44.h,
                fit: BoxFit.contain,
                color: AppColors.borderSecondary,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          for (var label in dropdownLabels) ...[
            _buildDropdownField(label),
            SizedBox(height: 24.h),
          ],
          Text(
            'Notes (Optional)',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 1,
              color: AppColors.textNormal,
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              hintText: "Add your notes",
              hintStyle: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 1,
                color: AppColors.textDisabled,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.w),
                borderSide: BorderSide(width: 1, color: AppColors.borderSecondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.w),
                borderSide: BorderSide(width: 1, color: AppColors.borderSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.khula(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 1,
            color: AppColors.textNormal,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w),
            border: Border.all(width: 1, color: AppColors.borderSecondary),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(6.w),
              dropdownColor: AppColors.bgAlert,
              value: selectedDropdownValues[label],
              hint: Text(
                'Choose',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.textDisabled,
                ),
              ),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down,color: AppColors.btnArrow,size: 16),
              items: dropdownOptions[label]!
                  .map((option) => DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBtn,
                  ),
                ),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDropdownValues[label] = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivateNotificationsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 17.w, right: 19.w),
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
                'assets/icons/Notifications.png',
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
            padding: EdgeInsets.all(3.w),
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
