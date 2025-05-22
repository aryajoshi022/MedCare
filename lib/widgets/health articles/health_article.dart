import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class  HealthArticle extends StatelessWidget {
  final String imge ;
  final String Artical;
  final String ArticalDiscrptipon;
  final String Date;

  const HealthArticle({
    super.key,
    required this.imge,
    required this.Artical,
    required this.ArticalDiscrptipon,
    required this.Date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            // Background image covering card size
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                imge,
                width: 88.w,
                height: 88.h,
                // fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
              child: Container(
                // width: 268.w,
                // height: 88.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,  // from top
                  crossAxisAlignment: CrossAxisAlignment.start, // from left
                  children: [
                    Text(
                      Artical,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        letterSpacing: 1,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      ArticalDiscrptipon,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        letterSpacing: 1,
                        color: Color(0xff090909),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      Date,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        letterSpacing: 1,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      );

  }
}
