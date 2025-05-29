import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/history_screen.dart';
import '../../util/constants/colors.dart';

class AppointmentSuccess extends StatefulWidget {
  const AppointmentSuccess({super.key});

  @override
  State<AppointmentSuccess> createState() => _AppointmentSuccessState();
}

class _AppointmentSuccessState extends State<AppointmentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/AppointmentSuccess.png',
              width: 172.26.w,
              height: 155.57.h,
              alignment: Alignment.center,
            ),
            SizedBox(height: 50.h),
            Text('Appointments have been made',
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  letterSpacing: 1.sp,
                  color: AppColors.textNormal
              ),
            ),
            SizedBox(height: 25.h),
            Text('Prepare your attendance well, arrive 30\nminutes before the appointed time',
              textAlign: TextAlign.center,
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  letterSpacing: 1.sp,
                  color: AppColors.textSecondary
              ),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              width: 200.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bgAlert,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    side: BorderSide(width: 1.w, color: AppColors.borderSecondary)
                  )
                ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen()));
                  },
                  child: Text('Go to details',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textBtn
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
