import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/home/home_screen.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedIndex = 2;
  bool _isUpcomingSelected = true;
  bool isSelected = false;
  final Map<String, bool> _notificationStatus = {
    'Dr. Giovanni Bianchi': true,
    'Dr. Luca Rossi': false,
  };
  double rating = 0;
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
      backgroundColor: AppColors.bgAlert,
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(),
            SizedBox(height: 5.h),
            _buildTabButtons(),
            SizedBox(height: 28.h),
            Expanded(
              child: _isUpcomingSelected
                  ? _buildUpcomingAppointmentsList()
                  : _buildCompletedAppointmentsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24.sp,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          Spacer(flex: 2),
          Text(
            'History',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              letterSpacing: 1.sp,
              color: AppColors.textNormal
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }

  Widget _buildTabButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(
            width: 1.w,
            color: AppColors.borderBtn
          ),
          color: AppColors.btnColor
        ),
        padding: EdgeInsets.all(4.w),
        child: Row(
          children: [
            Expanded(
              child: _buildTabButton('Upcoming', _isUpcomingSelected, () {
                setState(() => _isUpcomingSelected = true);
              }),
            ),
            Expanded(
              child: _buildTabButton('Completed', !_isUpcomingSelected, () {
                setState(() => _isUpcomingSelected = false);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(
    String text,
    bool isSelected,
    VoidCallback onTap
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.btnPrimary : AppColors.btnColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.khula(
              fontSize: 16.sp,
              letterSpacing: 1.sp,
              color: isSelected ? AppColors.textWhite: AppColors.textDisabled,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointmentsList() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      children: [
        Text(
          "1 Minggu yang akan datang",
          style: GoogleFonts.khula(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            letterSpacing: 1.sp,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        _buildUpcomingCard(
          context: context,
          doctorName: "Dr. Giovanni Bianchi",
          specialty: "General Surgery",
          date: "Wednesday, 29 Feb 04.00 pm",
          location: "Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy",
          image: "assets/images/Dr_Fabian_Weber.png",
          isNotificationOn: _notificationStatus["Dr. Giovanni Bianchi"] ?? false,
          onNotificationChange: (val) {
            setState(() {
              _notificationStatus["Dr. Giovanni Bianchi"] = val;
            });
          },
        ),
        SizedBox(height: 16.h),
        _buildUpcomingCard(
          context: context,
          doctorName: "Dr. Luca Rossi",
          specialty: "Cardiology Specialist",
          date: "Wednesday, 22 Feb 01.00 pm",
          location: "Rossi Cardiology Clinic, Via Garibaldi 15, Milan, Italy",
          image: "assets/images/Dr_Luca_Rossi.png",
          isNotificationOn: _notificationStatus["Dr. Luca Rossi"] ?? false,
          onNotificationChange: (val) {
            setState(() {
              _notificationStatus["Dr. Luca Rossi"] = val;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCompletedAppointmentsList() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      children: [
        _buildCompletedCard(
          doctorName: "Dr. Giovanni Bianchi",
          specialty: "General Surgery",
          date: "Wednesday, 29 Feb 04.00 pm",
          location:
          "Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy",
          image: "assets/images/Dr_Fabian_Weber.png",
          showStars: false,
        ),
        SizedBox(height: 16.h),
        _buildCompletedCard(
          doctorName: "Dr. Giovanni Bianchi",
          specialty: "General Surgery",
          date: "Wednesday, 29 Feb 04.00 pm",
          location:
          "Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy",
          image: "assets/images/Dr_Fabian_Weber.png",
          showStars: true,
        ),
      ],
    );
  }

  Widget _buildUpcomingCard({
    required BuildContext context,
    required String doctorName,
    required String specialty,
    required String date,
    required String location,
    required String image,
    required bool isNotificationOn,
    required Function(bool) onNotificationChange,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColors.bgAlert,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r)),
            border: Border(
              top: BorderSide(width: 1.w, color: AppColors.borderBtn),
              right: BorderSide(width: 1.w, color: AppColors.borderBtn),
              left: BorderSide(width: 1.w, color: AppColors.borderBtn),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textNormal),
                      ),
                      Text(
                        specialty,
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: AppColors.borderSecondary,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              Divider(color: AppColors.borderBtn),
              SizedBox(height: 13.h),
              _buildInfoRow(date, location),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r)),
            border: Border(
              bottom: BorderSide(width: 1.w, color: AppColors.borderBtn),
              right: BorderSide(width: 1.w, color: AppColors.borderBtn),
              left: BorderSide(width: 1.w, color: AppColors.borderBtn),
            ),
            color: AppColors.btnColor,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/Notifications.png',
                height: 16.h,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 4.w),
              GestureDetector(
                onTap: () {
                  showNotificationBottomSheet(
                    context: context,
                    isNotificationOn: isNotificationOn,
                    onSubmit: onNotificationChange,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Notifications',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      isNotificationOn ? "On" : "Off",
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textBtn,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: _showRescheduleSheet,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                    backgroundColor: AppColors.btnPrimary,
                    foregroundColor: AppColors.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Text(
                    'Reschedule',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompletedCard({
    required String doctorName,
    required String specialty,
    required String date,
    required String location,
    required String image,
    required bool showStars,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColors.bgAlert,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r)
            ),
            border: Border(
              top: BorderSide(width: 1.w, color: AppColors.borderBtn),
              right: BorderSide(width: 1.w, color: AppColors.borderBtn),
              left: BorderSide(width: 1.w, color: AppColors.borderBtn),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textNormal
                        ),
                      ),
                      Text(
                        specialty,
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textSecondary
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: AppColors.borderSecondary,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Divider(color: AppColors.borderBtn),
              SizedBox(height: 20.h),
              _buildInfoRow(date, location),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r)
            ),
            border: Border(
              bottom: BorderSide(width: 1.w, color: AppColors.borderBtn),
              right: BorderSide(width: 1.w, color: AppColors.borderBtn),
              left: BorderSide(width: 1.w, color: AppColors.borderBtn),
            ),
            color: AppColors.btnColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: showStars
                ? [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14.sp),
                        Icon(Icons.star_border_rounded, color: Color(0xffFFA740), size: 14.sp),
                      ],
                    ),
                    SizedBox(height: 9.h),
                    Row(
                      children: [
                        Text(
                          "My Review",
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textBtn
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12.sp,
                          color: AppColors.btnPrimary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                    side: BorderSide(color: AppColors.borderSecondary, width: 1.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Text(
                    "Next Appointment",
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.textBtn
                    ),
                  ),
                ),
              )
            ]
                : [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _showReviewSheet();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                    side: BorderSide(color: AppColors.borderSecondary, width: 1.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Text(
                    "Add Review",
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textBtn
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                    side: BorderSide(color: AppColors.borderSecondary, width: 1.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Text(
                    "Next Appointment",
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.textBtn
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String date, String location) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date& Time',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textDisabled
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                date,
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textBtn
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textDisabled
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                location,
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textBtn
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showRescheduleSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.bgAlert,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 16.h,
              left: 24.w,
              right: 24.w,
              bottom: 36.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 80.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.borderSecondary,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Text(
                    'Reschedule Appointment',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textNormal,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Working Hours',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 16.h),
                GridView.count(
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
                        setModalState(() {
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
                ),
                SizedBox(height: 24.h),
                Text(
                  'Schedule',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    letterSpacing: 1.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 16.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _scheduleDays.map((day) {
                      bool isSelected = day == _selectedDay;
                      return GestureDetector(
                        onTap: () {
                          setModalState(() {
                            _selectedDay = day;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 12.w),
                          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
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
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                          side: BorderSide(color: AppColors.borderSecondary, width: 1.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textBtn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                          backgroundColor: AppColors.btnPrimary,
                          foregroundColor: AppColors.textWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                        child: Text(
                          'Reschedule',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showReviewSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.bgAlert,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState){
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 36.h,
                top: 16.h,
                left: 24.w,
                right: 24.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 80.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppColors.borderSecondary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      'Review',
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          letterSpacing: 1.sp,
                          color: AppColors.textNormal
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Ratings',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textSecondary
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 24,
                    itemPadding: EdgeInsets.only(left: 0.w, right: 4.w),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rounded,
                      color: Color(0xffFFA740),
                      size: 24.sp,
                    ),
                    onRatingUpdate: (value) {
                      setModalState(() {
                        rating = value;
                      });
                    },
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Your review',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textSecondary
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      hintText: "Write your review",
                      hintStyle: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textDisabled
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        borderSide: BorderSide(width: 1.w, color: AppColors.borderBtn),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                            side: BorderSide(color: AppColors.borderSecondary, width: 1.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textBtn,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                            backgroundColor: AppColors.btnPrimary,
                            foregroundColor: AppColors.textWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                          ),
                          child: Text(
                            'Reschedule',
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              letterSpacing: 1.sp,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }

  void showNotificationBottomSheet({
    required BuildContext context,
    required bool isNotificationOn,
    required Function(bool) onSubmit,
  }) {
    bool tempSwitchValue = isNotificationOn;
    showModalBottomSheet(
      backgroundColor: AppColors.bgAlert,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 36.h,
                top: 16.h,
                left: 24.w,
                right: 24.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 80.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppColors.borderSecondary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      'Notification',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textNormal,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          width: 1.w, color: AppColors.borderThirsty),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Activate notifications",
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            letterSpacing: 1.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Switch(
                          value: tempSwitchValue,
                          activeColor: AppColors.btnGrey,
                          activeTrackColor: AppColors.btnPrimary,
                          onChanged: (val) {
                            setModalState(() {
                              tempSwitchValue = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r)),
                        // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                        backgroundColor: AppColors.btnPrimary,
                      ),
                      onPressed: () {
                        onSubmit(tempSwitchValue);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Submit',
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          letterSpacing: 1.sp,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}