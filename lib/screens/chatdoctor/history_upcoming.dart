import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/appointment_success.dart';

import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';

class HistoryUpcoming extends StatefulWidget {
  const HistoryUpcoming({super.key});

  @override
  State<HistoryUpcoming> createState() => _HistoryUpcomingState();
}

class _HistoryUpcomingState extends State<HistoryUpcoming> {
  int _selectedIndex = 2;
  bool _isUpcomingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomAppBar(context),
            // SizedBox(height: 24.h),
            _buildTabButtons(context),
            SizedBox(height: 33.h),
            _buildUpcomingAppointmentsList(context),
            SizedBox(height: 8.h),
            _buildCompletedAppointmentsList(context)
            // Expanded(
            //   child: _isUpcomingSelected
            //       ? _buildUpcomingAppointmentsList(context)
            //       : _buildCompletedAppointmentsList(context),
            // ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentSuccess(),));
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                'History',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: AppColors.textNormal
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(
            width: 1,
            color: AppColors.borderBtn
          ),
          color: AppColors.btnColor
        ),
        padding: EdgeInsets.all(4.w),
        child: Row(
          children: [
            Expanded(
              child: _buildTabButton(
                context: context,
                text: 'Upcoming',
                isSelected: _isUpcomingSelected,
                onTap: () {
                  setState(() {
                    _isUpcomingSelected = true;
                  });
                },
              ),
            ),
            Expanded(
              child: _buildTabButton(
                context: context,
                text: 'Completed',
                isSelected: !_isUpcomingSelected,
                onTap: () {
                  setState(() {
                    _isUpcomingSelected = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required BuildContext context,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.btnPrimary : AppColors.btnColor,
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.khula(
              fontSize: 16,
              letterSpacing: 1,
              color: isSelected ? AppColors.textWhite: AppColors.textDisabled,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointmentsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1 Minggu yang akan datang',
            style: GoogleFonts.khula(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: AppColors.textSecondary
            ),
          ),
          Container(
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
        ],
      ),
    );
  }

  Widget _buildCompletedAppointmentsList(BuildContext context) {
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rossi Cardiology Clinic\nVia Garibaldi 15, Milan, Italy',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      // letterSpacing: 1,
                      color: Color(0xff090909)
                  ),
                ),
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

}
