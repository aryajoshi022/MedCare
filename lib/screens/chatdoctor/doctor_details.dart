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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(context),
            _buildDoctorInfoSection(context),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEducationLicence(context),
                  SizedBox(height: 29.h),
                  Text(
                    'Practice Location',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Color(0xff090909)
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildPracticeLocationDropdown(context),
                  SizedBox(height: 29.h),
                  Text(
                    'Working Hours',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Color(0xff090909)
                    ),
                  ),
                  // SizedBox(height: 16.0),
                  _buildWorkingHoursGrid(context),
                  SizedBox(height: 29.0),
                  Text(
                    'Schedule',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Color(0xff090909)
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildScheduleDays(context),
                  SizedBox(height: 29.0),
                  Text(
                    'Review',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Color(0xff090909)
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildReviewSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
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
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16.0, left: 16.0, right: 16.0, bottom: 16.0),
      color: Color(0xffF6F1FF),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.textSecondary
            ),
            onPressed: () {
              // Navigator.pop(context); // Handle back navigation
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                'Doctor Details',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: Color(0xff090909),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.share_outlined,
                color: AppColors.textSecondary
            ),
            onPressed: () {
              // Handle share button action
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildDoctorInfoSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0),
      color: Color(0xffF6F1FF),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.w,
            backgroundColor: Color(0xffA6CFD5),
            child: CircleAvatar(
              radius: 46.w,
              backgroundImage: AssetImage('assets/images/Dr_Luca_Rossi.png'),
            ),
          ),
          SizedBox(height: 24.h),
          Text('Dr. Luca Rossi',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              letterSpacing: 1,
              color: Color(0xff090909)
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.h),
          Text('Cardiology Specialist • 3 Years',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 1,
              color: Color(0xff4D4D4D)
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
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
          SizedBox(height: 36.h),
        ],
      ),
    );
  }

  Widget _buildEducationLicence(BuildContext context) {
    return Row(
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
    );
  }

  Widget _buildPracticeLocationDropdown(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        color: Color(0xffF9F8FD)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Rossi Cardiology Clinic',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              // letterSpacing: 1,
              color: Color(0xff26408B)
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Color(0xff4D4D4D),
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingHoursGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2.0,
      children: <String>[
        '9.00 AM',
        '10.00 AM',
        '1.00 PM',
        '2.00 PM',
        '3.00 PM',
        '4.00 PM',
      ].map((time) {
        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.5.h),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w),
            border: Border.all(
                width: 1.w,
                color: Color(0xffE3E3E3)
            ),
          ),
          child: Center(
            child: Text(
              time,
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  // letterSpacing: 1,
                  color: Color(0xff4D4D4D)
              ),
              // textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildScheduleDays(BuildContext context) {
    final days = ['Wed\n22', 'Thu\n23', 'Fri\n24', 'Sat\n25', 'Sun\n26', 'Mon\n27'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((day) {
          // bool isSelected = day.startsWith('Wed'); // Highlight Wednesday as in the example
          return Container(
            margin: EdgeInsets.only(right: 12),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              // color: isSelected ? Colors.blue[100] : Colors.grey[200],
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(width: 1, color: Color(0xffE3E3E3)),
              // border: isSelected ? Border.all(color: Color(0xffE3E3E3)) : null,
            ),
            child: Center(
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  // color: isSelected ? Color(0xff26408B) : Color(0xff4D4D4D),
                  fontSize: 14,
                  color: Color(0xff4D4D4D)
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 1)
          ),
        ),
        SizedBox(width: 12,),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey, width: 1)
          ),
        ),
      ],
    );
  }
}
