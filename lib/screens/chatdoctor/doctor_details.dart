import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import 'package:medcare/screens/chatdoctor/chat_screen.dart';
import 'package:medcare/screens/chatdoctor/confirmation.dart';
import '../../util/constants/colors.dart';
class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isSelected = false;
  bool _isLocationExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.bgAlert,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(context),
            _buildDoctorInfoSection(context),
            Padding(
              padding: EdgeInsets.all(28.w),
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
                  // SizedBox(height: 16.h),
                  _buildWorkingHoursGrid(context),
                  SizedBox(height: 29.h),
                  Text(
                    'Schedule',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Color(0xff090909)
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildScheduleDays(context),
                  SizedBox(height: 29.h),
                  Text(
                    'Review',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Color(0xff090909)
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildReviewSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 14, bottom: 28, left: 28, right: 28),
        child: Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.w)
                ),
                side: BorderSide(
                  width: 1,
                  color: Color(0xff26408B),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              icon: Icon(Icons.chat_outlined,
              color: Color(0xff26408B),
              ),
              label: Text('Chat',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  // letterSpacing: 1,
                  color: Color(0xff26408B)
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Confirmation()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff26408B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w)
                  ),
                  // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h)
                  // side: BorderSide(
                  //   width: 1,
                  //   color: Color(0xff26408B),
                  // ),
                ),
                child: Text('Make An Appointment',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      // letterSpacing: 1,
                      color: Colors.white
                  ),maxLines: 1,overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16.h, left: 16.w, right: 16.w, bottom: 16.h),
      color: Color(0xffF6F1FF),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.textSecondary
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDoctor(),));
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
                    letterSpacing: 1,
                    color: Color(0xff26408B)
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                    letterSpacing: 1,
                    color: Color(0xff26408B)
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        color: const Color(0xffF9F8FD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isLocationExpanded = !_isLocationExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rossi Cardiology Clinic',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xff26408B),
                  ),
                ),
                AnimatedRotation(
                  turns: _isLocationExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.btnSecondary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          if (_isLocationExpanded) ...[
            SizedBox(height: 13.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    'Rossi Cardiology Clinic Via Garibaldi 15, Milan, Italy',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.phone, size: 14, color: AppColors.textSecondary),
                SizedBox(width: 6.w),
                Text(
                  '(+21) 6125 7162  7126',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xff7266D7),
                  ),
                ),
              ],
            ),
          ]
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
      childAspectRatio: 1.75,
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
          // padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w),
            border: Border.all(
                width: 1.w,
                color: Color(0xffE3E3E3)
            ),
            color: isSelected? AppColors.btnPrimary : AppColors.bgAlert
          ),
          child: Center(
            child: Text(
              time,
              style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  // letterSpacing: 1,
                  color: isSelected ? AppColors.textWhite : AppColors.textSecondary
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((day) {
          // bool isSelected = day.startsWith('Wed'); // Highlight Wednesday as in the example
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              border: Border.all(width: 1, color: Color(0xffE3E3E3)),
              color: isSelected? AppColors.btnPrimary : AppColors.bgAlert
              // border: isSelected ? Border.all(color: Color(0xffE3E3E3)) : null,
            ),
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: isSelected ? AppColors.textWhite : AppColors.textSecondary
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReviewCard(
            name: 'Emily Johnson',
            daysAgo: '1 day ago',
            rating: 4,
            reviewText:
            'My consultation with Dr. Luca Rossi was excellent. He\'s knowledgeable, attentive, and provid...',
            image: 'assets/images/Emily_Johnson.png',
          ),
          SizedBox(width: 16.w),
          _buildReviewCard(
            name: 'Daniel Anderson',
            daysAgo: '8 days ago',
            rating: 5,
            reviewText:
            'My consultation with Dr. Luca Rossi was excellent. He\'s knowledgeable, attentive, and provid...',
            image: 'assets/images/Daniel_Anderson.png',
          ),
        ],
      ),
    );
  }

}

Widget _buildReviewCard({
  required String name,
  required String daysAgo,
  required int rating,
  required String reviewText,
  required String image,
}) {
  return Container(
    width: 269.w,
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(
          width: 1.w,
          color: AppColors.borderBtn
      ),
      // boxShadow: [
      //   BoxShadow(
      //     color: Color(0xffE3E3E3),
      //     blurRadius: 10,
      //     spreadRadius: 0,offset: Offset(4, 4),blurStyle: BlurStyle.outer
      //   ),
      // ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 28.w,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 1,
                    color: Color(0xff090909)
                  ),
                ),
                Text(
                  daysAgo,
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    letterSpacing: 1,
                    color: Color(0xff4D4D4D)
                  ),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star_rounded : Icons.star_border_rounded,
                      color: Color(0xffFFA740),
                      size: 14.0,
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          reviewText,
          style: GoogleFonts.khula(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 1,
            color: Color(0xff4D4D4D)
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              // Handle more view action
            },
            child: Text('More view',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 1,
                color: Color(0xff26408B)
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
