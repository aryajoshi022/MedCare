import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/constants/colors.dart';
class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: (){},
      //     icon: Icon(Icons.chevron_left,
      //       color: Color(0xff4D4D4D),
      //       // size: 16,
      //     ),
      //   ),
      //   leadingWidth: 67,
      //   titleSpacing: 0,
      //   title: Text('Doctor Details',
      //     style: GoogleFonts.khula(
      //       fontWeight: FontWeight.w400,
      //       fontSize: 16,
      //       color: Color(0xff090909),
      //       letterSpacing: 1,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.share, color: Colors.black),
      //       onPressed: () {
      //         // Handle share button action
      //       },
      //     ),
      //   ],
      //   surfaceTintColor: Colors.white,
      // ),
      body: Container(
        width: 428.w,
        height: 372.h,
        padding: EdgeInsets.only(top: 60, left: 28, right: 28),
        color: Colors.purple,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.chevron_left),
                  ),
                  Text('Doctor Details',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Color(0xff090909),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.share_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36),
            Container(
              width: 268.w,
              height: 187.h,
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: 268.w,
                    height: 63.h,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text('Dr. Luca Rossi'),
                        Text('Cardiology Specialist . 3 Years'),
                        Text('*****12 Reviews')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
