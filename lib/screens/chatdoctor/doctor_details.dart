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
  final List<String> _workingHours = [
    '9.00 AM',
    '10.00 AM',
    '1.00 PM',
    '2.00 PM',
    '3.00 PM',
    '4.00 PM',
  ];
  String _selectedHour = '';
  final List<String> _scheduleDays = [
    'Wed\n22',
    'Thu\n23',
    'Fri\n24',
    'Sat\n25',
    'Sun\n26',
    'Mon\n27'
  ];
  String _selectedDay = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F1FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(context),
            _buildDoctorInfoSection(context),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36.r),
                  topRight: Radius.circular(36.r)
                ),
                color: AppColors.bgAlert
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildEducationLicence(context),
                        SizedBox(height: 29.h),
                        Text(
                          'Practice Location',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textNormal
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildPracticeLocationDropdown(context),
                        SizedBox(height: 29.h),
                        Text(
                          'Working Hours',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textNormal
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildWorkingHoursGrid(context),
                        SizedBox(height: 29.h),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Schedule',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textNormal
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildScheduleDays(context),
                        SizedBox(height: 29.h),
                        Text(
                          'Review',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textNormal
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.bgAlert,
        child: Padding(
          padding: EdgeInsets.only(top: 14.h, bottom: 28.h+MediaQuery.of(context).padding.bottom, left: 28.w, right: 28.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bgAlert,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r)
                  ),
                  side: BorderSide(
                    width: 1.w,
                    color: AppColors.bgPrimary,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                icon: Image.asset('assets/icons/Chat.png',
                  height: 31.h,
                  width: 31.w,
                  color: AppColors.btnPrimary,
                ),
                label: Text('Chat',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textBtn
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Confirmation()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bgPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h)
                  ),
                  child: Text('Make An Appointment',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textWhite
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top.h + 16.h, left: 16.w, right: 16.w, bottom: 16.h),
      color: Color(0xffF6F1FF),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24.sp,
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
                  fontSize: 16.sp,
                  letterSpacing: 1.sp,
                  color: AppColors.textNormal,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Image.asset('assets/icons/Share.png',
              height: 24.h,
              width: 24.w,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
  
  Widget _buildDoctorInfoSection(BuildContext context) {
    return Container(
      color: Color(0xffF6F1FF),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.borderSecondary,
                child: CircleAvatar(
                  radius: 46.r,
                  backgroundImage: AssetImage('assets/images/Dr_Luca_Rossi.png'),
                ),
              ),
              Positioned(
                bottom: 7.h,
                right: 6.w,
                child: CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppColors.borderSecondary,
                  child: CircleAvatar(
                    radius: 9.r,
                    backgroundColor: Color(0xff6E9024),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text('Dr. Luca Rossi',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              letterSpacing: 1.sp,
              color: AppColors.textNormal
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.h),
          Text('Cardiology Specialist • 3 Years',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              letterSpacing: 1.sp,
              color: AppColors.textSecondary
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        SizedBox(width: 22.w),
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
    );
  }

  Widget _buildPracticeLocationDropdown(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.btnColor,
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
                    fontSize: 14.sp,
                    color: AppColors.textBtn,
                  ),
                ),
                AnimatedRotation(
                  turns: _isLocationExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.btnSecondary,
                    size: 24.sp,
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
                Image.asset('assets/icons/Map_Pin.png',
                  width: 14.w,
                  height: 14.h,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    'Rossi Cardiology Clinic Via Garibaldi 15, Milan, Italy',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
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
                Image.asset('assets/icons/Call.png',
                  width: 14.w,
                  height: 14.h,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 6.w),
                Text(
                  '(+21) 6125 7162  7126',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
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
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.75,
      children: _workingHours.map((time) {
        bool isSelected = time == _selectedHour;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedHour = time;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(width: 1.w, color: AppColors.borderBtn),
              color: isSelected ? AppColors.btnPrimary : AppColors.bgAlert,
            ),
            child: Center(
              child: Text(
                time,
                style: GoogleFonts.khula(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14.sp,
                  color: isSelected ? AppColors.textWhite : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildScheduleDays(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _scheduleDays.map((day) {
          bool isSelected = day == _selectedDay;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = day;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                border: Border.all(width: 1.w, color: AppColors.borderBtn),
                color: isSelected ? AppColors.btnPrimary : AppColors.bgAlert,
              ),
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: GoogleFonts.khula(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14.sp,
                  color: isSelected ? AppColors.textWhite : AppColors.textSecondary,
                ),
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
          // SizedBox(width: 16.w),
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

  Widget _buildReviewCard({
    required String name,
    required String daysAgo,
    required int rating,
    required String reviewText,
    required String image,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w,bottom: 17.h),
      child: Container(
        width: 269.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.bgAlert,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(4, 4)
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28.r,
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
                          fontSize: 14.sp,
                          letterSpacing: 1.sp,
                          color: AppColors.textNormal
                      ),
                    ),
                    Text(
                      daysAgo,
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          letterSpacing: 1.sp,
                          color: AppColors.textSecondary
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star_rounded : Icons.star_border_rounded,
                          color: Color(0xffFFA740),
                          size: 14.sp,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: reviewText,
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 5.w),
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Text(
                        ' More view',
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          letterSpacing: 1.sp,
                          color: AppColors.textBtn,
                        ),
                      ),
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