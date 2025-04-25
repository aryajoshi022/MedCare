import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/appointment_success.dart';
import 'package:medcare/screens/chatdoctor/doctor_details.dart';

import '../../util/constants/colors.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 14, bottom: 28, left: 28, right: 28),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentSuccess(),));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff26408B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.w)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h)
                  // side: BorderSide(
                  //   width: 1,
                  //   color: Color(0xff26408B),
                  // ),
                ),
                child: Text('Check In',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      // letterSpacing: 1,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomAppBar(context),
            SizedBox(height: 24.h),
            _buildDoctorInfoCard(context),
            SizedBox(height: 20.0),
            _buildDetailAppointmentCard(context),
            SizedBox(height: 20.0),
            _buildActivateNotificationsSection(context),
            SizedBox(height: 32.0),
            _buildCheckInButton(context),
            SizedBox(height: 8.0),
            _buildSwipeToCheckInText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16.0, left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
                Icons.chevron_left,
                color: AppColors.textSecondary
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails(),));
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                'Confirmation',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: Color(0xff090909),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16.0, left: 16.0, right: 16.0, bottom: 16.0),
    //   child: Row(
    //     children: [
    //       IconButton(
    //         icon: Icon(Icons.arrow_back, color: Colors.black),
    //         onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails(),));
    //         },
    //       ),
    //       Expanded(
    //         child: Center(
    //           child: Text(
    //             'Confirmation',
    //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
    //           ),
    //         ),
    //       ),
    //       SizedBox(width: 48.0), // Space for alignment
    //     ],
    //   ),
    // );
  }

  Widget _buildDoctorInfoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 28),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50.w,
                backgroundColor: Color(0xffA6CFD5),
                child: CircleAvatar(
                  radius: 46.w,
                  backgroundImage: AssetImage('assets/images/Dr_Luca_Rossi.png'),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                children: [
                  Text('Dr. Luca Rossi',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 1,
                        color: Color(0xff090909)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 14.h),
                  Text('Cardiology Specialist • 3 Years',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 1,
                        color: Color(0xff4D4D4D)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                      Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                      Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                      Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                      Icon(Icons.star_border_rounded, color: Color(0xffFFA740), size: 14),
                      SizedBox(width: 8.w),
                      Text('(12 Reviews)',
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: Color(0xff4D4D4D)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.w),
                    border: Border.all(
                        width: 1.w,
                        color: Color(0xffE3E3E3)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Education',
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: Color(0xff4D4D4D)
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text('University of Milan',
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            // letterSpacing: 1,
                            color: Color(0xff26408B)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 22.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.w),
                    border: Border.all(
                        width: 1.w,
                        color: Color(0xffE3E3E3)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('License',
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: Color(0xff4D4D4D)
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text('1276126552881',
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            // letterSpacing: 1,
                            color: Color(0xff26408B)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailAppointmentCard(BuildContext context) {
    return Container();
  }

  Widget _buildActivateNotificationsSection(BuildContext context) {
    return Container();
  }

  Widget _buildCheckInButton(BuildContext context) {
    return Container();
  }

  Widget _buildSwipeToCheckInText(BuildContext context) {
    return Container();
  }
}
