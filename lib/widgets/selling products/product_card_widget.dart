import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            SizedBox(
              height: 81.h,
              width: 81.w,
              child: Image.asset(
                imagePath,
                height: 81.h,
                width: 81.w,
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
                        productName,
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
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
