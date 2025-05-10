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
  bool _notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      bottomNavigationBar: Container(
        height: 132.h,
        color: AppColors.bgAlert,
        child: Padding(
          padding: EdgeInsets.only(top: 14, left: 28, right: 28),
          child: Column(
            children: [
              Row(
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
              SizedBox(height: 16.h),
              Text('Swipe to check in',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppColors.textSecondary
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomAppBar(context),
            SizedBox(height: 24.h),
            _buildDoctorInfoCard(context),
            SizedBox(height: 28.h),
            _buildDetailAppointmentCard(context),
            SizedBox(height: 20.h),
            _buildActivateNotificationsSection(context),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16.h, left: 16.w, right: 16.w, bottom: 16.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
                Icons.chevron_left,
                color: AppColors.btnSecondary
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
                  color: AppColors.textNormal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorInfoCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(
            width: 1,
            color: Color(0xffE3E3E3),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 10,
          //     spreadRadius: 0,
          //     blurStyle: BlurStyle.outer,
          //     offset: Offset.fromDirection(double.infinity),
          //     color: Color(0xff0000000D)
          //   ),
          // ],
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dr. Luca Rossi',
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: 1,
                          color: Color(0xff090909)
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text('Cardiology Specialist • 3 Years',
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          // letterSpacing: 1,
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
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
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
                SizedBox(width: 14.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailAppointmentCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(
            width: 1,
            color: Color(0xffE3E3E3),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 10,
          //     spreadRadius: 0,
          //     blurStyle: BlurStyle.outer,
          //     offset: Offset.fromDirection(double.infinity),
          //     color: Color(0xff0000000D)
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Appointment',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: Color(0xff26408B)
                ),
            ),
            SizedBox(height: 24.h),
            Divider(
              thickness: 1.0, color: Color(0xffE3E3E3)
            ),
            SizedBox(height: 24.h),
            Text(
              'Date & Time',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 1,
                    color: Color(0xff4D4D4D)
                ),
            ),
            SizedBox(height: 14.h),
            Text(
              'Wednesday, 22 Feb 1.00PM',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    // letterSpacing: 1,
                    color: Color(0xff090909)
                ),
            ),
            SizedBox(height: 32.h),
            Text(
              'Location',
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Color(0xff4D4D4D)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 181.w,
                  child: Text(
                    'Rossi Cardiology Clinic Via Garibaldi 15, Milan, Italy',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        // letterSpacing: 1,
                        color: Color(0xff090909)
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // SizedBox(width: 40.w),
                TextButton(
                  onPressed: () {
                    // Handle see maps
                  },
                  child: Text('See Maps>',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      // letterSpacing: 1,
                      color: Color(0xff26408B)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivateNotificationsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(
            width: 1,
            color: Color(0xffE3E3E3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/cart.png',
                  height: 24.h,
                  color: AppColors.bgPrimary,
                ),
                SizedBox(width: 8.w),
                Text('Activate notifications',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 1,
                    color: Color(0xff4D4D4D)
                ),),
              ],
            ),
            Switch(
              value: _notificationsEnabled,
              activeColor: Color(0xffFFFFFF),
              activeTrackColor: Color(0xff26408B),// Replace with actual state
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
                // Handle switch state change
              },
            ),
          ],
        ),
      ),
    );
  }

}
