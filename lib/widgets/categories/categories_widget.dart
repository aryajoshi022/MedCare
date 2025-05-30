import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Icon container
          Container(
            height: 81.h,
            width: 81.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.05), // shadow color with opacity
                  spreadRadius: 0,   // how wide the shadow spreads
                  blurRadius: 10,     // how soft the shadow is
                  offset: Offset(2, 2), // x,y offset of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 3.w,right: 3.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13.5.h),
                    child: Container(
                      height: 36.h,
                      child: Image.asset(iconPath),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    height: 24.h,
                    alignment: Alignment.topCenter,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: Color(0xff26408B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
