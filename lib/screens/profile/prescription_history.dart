import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/profile/profile_screen.dart';

import '../../util/constants/colors.dart';

class PrescriptionHistory extends StatefulWidget {
  const PrescriptionHistory({super.key});

  @override
  State<PrescriptionHistory> createState() => _PrescriptionHistoryState();
}

class _PrescriptionHistoryState extends State<PrescriptionHistory> {
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
          Expanded(
            child:  Text('Prescription History',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.textNormal,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildActiveRecipe(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(6.w),
  //       border: Border.all(width: 1, color: AppColors.borderBtn)
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Active Recipe',
  //               style: GoogleFonts.khula(
  //                 fontWeight: FontWeight.w400,
  //                 fontSize: 16,
  //                 color: AppColors.textBtn,
  //               ),
  //             ),
  //             Icon(
  //               Icons.keyboard_arrow_down,
  //               color: AppColors.btnSecondary,
  //               size: 24,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildActiveRecipe(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(width: 1, color: AppColors.borderBtn), // match screenshot border
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedOption,
          icon: Icon(
            Icons.keyboard_arrow_up, // use down or up depending on state
            color: AppColors.btnSecondary,
            size: 20,
          ),
          isExpanded: true,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(6.w),
          style: GoogleFonts.khula(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: option == selectedOption
                      ? AppColors.btnPrimary
                      : AppColors.textSecondary,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedOption = value;
              });
            }
          },
        ),
      ),
    );
  }

}
