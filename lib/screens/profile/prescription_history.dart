import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/profile/profile_screen.dart';

import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';

class PrescriptionHistory extends StatefulWidget {
  const PrescriptionHistory({super.key});

  @override
  State<PrescriptionHistory> createState() => _PrescriptionHistoryState();
}

class _PrescriptionHistoryState extends State<PrescriptionHistory> {
  int _selectedIndex = 3;
  bool isDropdownOpen = false;
  String selectedOption = 'Active Recipe';

  final List<String> options = [
    'Active Recipe',
    'Past Prescriptions',
    'Recent Prescriptions',
    'Oldest Prescriptions',
  ];

  final List<Map<String, dynamic>> prescriptions = [
    {
      'doctorName': 'Dr. Emily Smith, MD',
      'medicines': [
        {
          'title': 'Paracetamol 500 mg',
          'subtitle': 'Take 1 tablet every 6 hours as needed to reduce fever or pain.',
        },
        {
          'title': 'Amoxicillin 500 mg',
          'subtitle': 'Take 1 tablet every 8 hours for 7 days to treat bacterial infection',
        },
        {
          'title': 'Omeprazole 20 mg',
          'subtitle': 'Take 1 tablet every morning before eating to reduce stomach acid production.',
        },
      ],
      'date': '12 June 2024 - 20 June 2024',
    },
    {
      'doctorName': 'Dr. Emily Smith, MD',
      'medicines': [
        {
          'title': 'Paracetamol 500 mg',
          'subtitle': 'Take 1 tablet every 6 hours as needed to reduce fever or pain.',
        },
        {
          'title': 'Amoxicillin 500 mg',
          'subtitle': 'Take 1 tablet every 8 hours for 7 days to treat bacterial infection',
        },
        {
          'title': 'Omeprazole 20 mg',
          'subtitle': 'Take 1 tablet every morning before eating to reduce stomach acid production.',
        },
      ],
      'date': '10 June 2024 - 17 June 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            _buildActiveRecipe(context),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                itemCount: prescriptions.length,
                itemBuilder: (context, index) {
                  final prescription = prescriptions[index];
                  return _buildPrescriptionGroup(prescription);
                },
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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileScreen()));
            },
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24,
            ),
          ),
          Spacer(flex: 2),
          Text('Prescription History',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.textNormal,
              letterSpacing: 1,
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }

  Widget _buildActiveRecipe(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(width: 1, color: AppColors.borderBtn),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isDropdownOpen = !isDropdownOpen;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedOption,
                      style: GoogleFonts.khula(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.btnPrimary,
                      ),
                    ),
                    Icon(
                      isDropdownOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.btnPrimary,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            if (isDropdownOpen)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options
                    .where((item) => item != selectedOption)
                    .map((option) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOption = option;
                      isDropdownOpen = false;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: Text(
                      option,
                      style: GoogleFonts.khula(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrescriptionGroup(Map<String, dynamic> data) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(width: 1, color: AppColors.borderBtn),
      ),
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: AppColors.btnPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.w),
                topRight: Radius.circular(12.w),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Doctor's Name: ${data['doctorName']}",
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.bgAlert,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12.w),
              ),
            ),
            child: Column(
              children: List.generate(
                (data['medicines'] as List).length,
                    (index) {
                  final medicine = data['medicines'][index];
                  final isLast = index == (data['medicines'] as List).length - 1;

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                    decoration: BoxDecoration(
                      border: isLast
                          ? null
                          : Border(
                        bottom: BorderSide(
                          color: AppColors.borderBtn,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicine['title'],
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.textNormal,
                          ),
                        ),
                        // SizedBox(height: 12.h),
                        Text(
                          medicine['subtitle'],
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 7.h),
            decoration: BoxDecoration(
              color: AppColors.borderBtn,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.w),
                bottomRight: Radius.circular(12.w),
              ),
            ),
            child: Center(
              child: Text(
                data['date'],
                style: GoogleFonts.khula(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textDisabled,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}