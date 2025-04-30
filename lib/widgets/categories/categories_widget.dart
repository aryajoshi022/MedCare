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
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // shadow color with opacity
                  spreadRadius: 2,   // how wide the shadow spreads
                  blurRadius: 10,     // how soft the shadow is
                  offset: Offset(0, 5), // x,y offset of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 13.5),
                  child: Container(
                    height: 36.h,
                    child: Image.asset(iconPath),
                  ),
                ),
                SizedBox(height: 6),
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
                        fontSize: 10,
                        color: Color(0xff26408B),
                      ),
                    ),
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
