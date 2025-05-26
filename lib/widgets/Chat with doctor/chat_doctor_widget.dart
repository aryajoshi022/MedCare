import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDoctorCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String specialization;
  final VoidCallback onTap;

  const ChatDoctorCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.specialization,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            SizedBox(
              height: 160.h,
              width: 160.w,
              child: Image.asset(
                imagePath,
                height: 160.h,
                width: 160.w,
                fit: BoxFit.cover,
              ),
            ),
            // Centered Column
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        specialization,
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
