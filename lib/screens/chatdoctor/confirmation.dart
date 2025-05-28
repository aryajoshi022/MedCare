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
  double _dragOffset = 0.0;
  final double _maxDrag = 220.w;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      bottomNavigationBar: Container(
        height: 118.h,
        color: AppColors.bgAlert,
        padding: EdgeInsets.only(top: 14.h, left: 28.w, right: 28.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                  height: 51.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bgPrimary,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Check In',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
                Positioned(
                  left: _dragOffset + 3.w,
                  top: 3.h,
                  bottom: 3.h,
                  child: GestureDetector(
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.bgAlert,
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 23.w,
                        height: 23.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.bgPrimary,
                        ),
                        padding: EdgeInsets.all(4.w),
                        child: Image.asset('assets/icons/Double_Arrow_Write.png',
                          width: 8.17.w,
                          height: 7.56.h,
                          color: AppColors.bgAlert,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'Swipe to check in',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                letterSpacing: 1.sp,
                color: AppColors.textSecondary,
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
            // SizedBox(height: 24.h),
            _buildDoctorInfoCard(context),
            SizedBox(height: 24.h),
            _buildDetailAppointmentCard(context),
            SizedBox(height: 24.h),
            _buildActivateNotificationsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top.h + 16.h, left: 16.w, right: 16.w, bottom: 16.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24.sp,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails(),));
            },
          ),
          Spacer(flex: 2),
          Text(
            'Confirmation',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              letterSpacing: 1.sp,
              color: AppColors.textNormal,
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }

  Widget _buildDoctorInfoCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        width: 372.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: AppColors.bgAlert,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1,
            color: AppColors.borderBtn
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(4, 4)
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.borderSecondary,
                  child: CircleAvatar(
                    radius: 46.r,
                    backgroundImage: AssetImage('assets/images/Dr_Luca_Rossi.png'),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Luca Rossi',
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textNormal
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text('Cardiology Specialist • 3 Years',
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textSecondary
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 7.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                          Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                          Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                          Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                          Icon(Icons.star_border_rounded, color: Color(0xffFFA740), size: 14.sp),
                          SizedBox(width: 8.w),
                          Text('(12 Reviews)',
                            style: GoogleFonts.khula(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                letterSpacing: 1.sp,
                                color: AppColors.textSecondary
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                          width: 1.w,
                          color: AppColors.borderBtn
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Education',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textSecondary
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text('University of Milan',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textBtn
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                          width: 1.w,
                          color: AppColors.borderBtn
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('License',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textSecondary
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text('1276126552881',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textBtn
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
        width: 372.w,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.bgAlert,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
              width: 1,
              color: AppColors.borderBtn
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xff000000).withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(4, 4)
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Appointment',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  letterSpacing: 1.sp,
                  color: AppColors.textBtn
                ),
            ),
            SizedBox(height: 10.h),
            Divider(
              thickness: 1.0.w,
              color: AppColors.borderBtn
            ),
            SizedBox(height: 10.h),
            Text(
              'Date & Time',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textSecondary
                ),
            ),
            SizedBox(height: 7.h),
            Text(
              'Wednesday, 22 Feb 1.00PM',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textNormal
                ),
            ),
            SizedBox(height: 25.h),
            Text(
              'Location',
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  letterSpacing: 1.sp,
                  color: AppColors.textSecondary
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
                        fontSize: 14.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textNormal
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See Maps >',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textBtn
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
        padding: EdgeInsets.only(left: 17.w, right: 19.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.borderThirsty,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/Notifications.png',
                  height: 24.h,
                  color: AppColors.bgPrimary,
                ),
                SizedBox(width: 8.w),
                Text('Activate notifications',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textSecondary
                  ),
                ),
              ],
            ),
            Switch(
              value: _notificationsEnabled,
              activeColor: AppColors.bgAlert,
              activeTrackColor: AppColors.bgPrimary,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta.dx;
      _dragOffset = _dragOffset.clamp(0, _maxDrag);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragOffset > _maxDrag * 0.8) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppointmentSuccess()),
      );
      setState(() => _dragOffset = 0.0);
    } else {
      setState(() => _dragOffset = 0.0);
    }
  }

}