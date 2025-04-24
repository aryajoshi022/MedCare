import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String label;

  const CategoryItem({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                offset: Offset(2, 2), // x=2, y=2
                blurRadius: 10,      // blur amount
                spreadRadius: 0,     // spread amount
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
    );
  }
}
