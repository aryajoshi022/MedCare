import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalCard extends StatelessWidget {
  final String Hospital ;
  final String HospitalLogo;
  final VoidCallback onTap;

  const HospitalCard({
    super.key,
    required this.Hospital,
    required this.HospitalLogo,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        child: Stack(
          children: [
            // Background image covering card size
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                "assets/images/Hospitals/background.png",
                width: 160.w,
                height: 160.h,
                fit: BoxFit.fill,
              ),
            ),

            // Content on top of background
            Container(
              width: 160.w,
              height: 160.h,
              padding:EdgeInsets.only(top: 14.h,left: 14.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,  // from top
                crossAxisAlignment: CrossAxisAlignment.start, // from left
                children: [
                  Image.asset(
                    HospitalLogo,
                    height: 36.h,
                    width: 61.96.w,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    Hospital,
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      letterSpacing: 1,
                      color: Color(0xff26408B),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "See maps >",
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                      letterSpacing: 1,
                      color: Color(0xff8F8F8F),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );

  }
}
