import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;

  const HealthProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            height: 178.h,
            width: 178.w,
            child: Image.asset(
              imagePath,
              height: 178.h,
              width: 178.w,
              fit: BoxFit.fill,
            ),
          ),
          // Centered Column
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      productName,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
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
    );
  }
}
