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
                  _buildActiveRecipe(context),
                  SizedBox(height: 24.h),
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
          Text('Prescription History',
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

  Widget _buildActiveRecipe(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(width: 1, color: AppColors.borderBtn)
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
    );
  }

}
