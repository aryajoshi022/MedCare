import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomAppBar(),
            SizedBox(height: 24.h),
            _buildTabButtons(),
            SizedBox(height: 33.h),
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
                color: AppColors.btnSecondary
            ),
            onPressed: () {},
          ),
          Spacer(flex: 2,),
          Text(
            'History',
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 1,
              color: AppColors.textNormal
            ),
          ),
          Spacer(flex: 3,)
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
            width: 1,
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

  Widget _buildUpcomingAppointmentsList() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      children: [
        Text(
          "1 Minggu yang akan datang",
          style: GoogleFonts.khula(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 1,
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
        const SizedBox(height: 16),
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
        const SizedBox(height: 16),
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.w),
                topRight: Radius.circular(12.w)),
            border: Border(
              top: BorderSide(width: 1, color: AppColors.borderBtn),
              right: BorderSide(width: 1, color: AppColors.borderBtn),
              left: BorderSide(width: 1, color: AppColors.borderBtn),
            ),
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
                            fontSize: 16,
                            letterSpacing: 1,
                            color: AppColors.textNormal),
                      ),
                      Text(
                        specialty,
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22.w,
                    backgroundColor: AppColors.borderSecondary,
                    child: CircleAvatar(
                      radius: 18.w,
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
                bottomLeft: Radius.circular(12.w),
                bottomRight: Radius.circular(12.w)),
            border: Border(
              bottom: BorderSide(width: 1, color: AppColors.borderBtn),
              right: BorderSide(width: 1, color: AppColors.borderBtn),
              left: BorderSide(width: 1, color: AppColors.borderBtn),
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
                        fontSize: 12,
                        letterSpacing: 1,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      isNotificationOn ? "On" : "Off",
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 1,
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
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  backgroundColor: AppColors.btnPrimary,
                  foregroundColor: AppColors.textWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.w),
                  ),
                ),
                child: Text(
                  'Reschedule',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 1,
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.w),
                topRight: Radius.circular(12.w)
            ),
            border: Border(
              top: BorderSide(width: 1, color: AppColors.borderBtn),
              right: BorderSide(width: 1, color: AppColors.borderBtn),
              left: BorderSide(width: 1, color: AppColors.borderBtn),
            ),
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
                            fontSize: 16,
                            letterSpacing: 1,
                            color: AppColors.textNormal
                        ),
                      ),
                      Text(
                        specialty,
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: AppColors.textSecondary
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22.w,
                    backgroundColor: AppColors.borderSecondary,
                    child: CircleAvatar(
                      radius: 18.w,
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
                bottomLeft: Radius.circular(12.w),
                bottomRight: Radius.circular(12.w)
            ),
            border: Border(
              bottom: BorderSide(width: 1, color: AppColors.borderBtn),
              right: BorderSide(width: 1, color: AppColors.borderBtn),
              left: BorderSide(width: 1, color: AppColors.borderBtn),
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
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                        Icon(Icons.star_rounded, color: Color(0xffFFA740), size: 14),
                        Icon(Icons.star_border_rounded, color: Color(0xffFFA740), size: 14),
                      ],
                    ),
                    SizedBox(height: 9.h),
                    Row(
                      children: [
                        Text(
                          "My Review",
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: 1,
                              color: AppColors.textBtn
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: AppColors.btnPrimary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                    side: BorderSide(color: AppColors.borderSecondary, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                  ),
                  child: Text(
                    "Next Appointment",
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
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
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                    side: BorderSide(color: AppColors.borderSecondary, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                  ),
                  child: Text(
                    "Add Review",
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 1,
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
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                    side: BorderSide(color: AppColors.borderSecondary, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                  ),
                  child: Text(
                    "Next Appointment",
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: AppColors.textBtn
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
        // Date & Time Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date& Time',
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 1,
                    color: AppColors.textDisabled
                ),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    // letterSpacing: 1,
                    color: AppColors.textBtn
                ),
              ),
            ],
          ),
        ),

        // Location Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 1,
                    color: AppColors.textDisabled
                ),
              ),
              SizedBox(height: 4),
              Text(
                location,
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    // letterSpacing: 1,
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.w)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (ctx, scrollCtrl) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 36.h,
              top: 16.h,
              left: 24.w,
              right: 24.w,
            ),
            child: ListView(
              controller: scrollCtrl,
              children: [
                Center(
                  child: Container(
                    width: 80.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.borderSecondary,
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Center(
                  child: Text(
                    'Reschedule Appointment',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: AppColors.textNormal,
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
                Text(
                  'Working Hours',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 1,
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
                          borderRadius: BorderRadius.circular(6.w),
                          border: Border.all(width: 1.w, color: AppColors.borderBtn),
                          color: isSelected ? AppColors.btnPrimary : AppColors.bgAlert,
                        ),
                        child: Center(
                          child: Text(
                            time,
                            style: GoogleFonts.khula(
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              fontSize: 14,
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
                    fontSize: 16,
                    letterSpacing: 1,
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
                            borderRadius: BorderRadius.circular(6.w),
                            border: Border.all(width: 1, color: AppColors.borderBtn),
                            color: isSelected ? AppColors.btnPrimary : AppColors.bgAlert,
                          ),
                          child: Text(
                            day,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.khula(
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              fontSize: 14,
                              color: isSelected ? AppColors.textWhite : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 36.h),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.w)),
                          side: BorderSide(color: AppColors.borderThirsty, width: 1),
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 1,
                            color: AppColors.textBtn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.w)),
                          backgroundColor: AppColors.btnPrimary,
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text(
                          'Reschedule',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 1,
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.w)),
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
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 34.h),
                  Center(
                    child: Text(
                      'Review',
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          letterSpacing: 1,
                          color: AppColors.textNormal
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Text(
                    'Ratings',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: AppColors.textSecondary
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Row(
                  //   children: List.generate(
                  //     5,
                  //     (index) => const Icon(
                  //       Icons.star_border_rounded,
                  //       color: Color(0xffFFA740),
                  //       size: 24,
                  //     ),
                  //   ),
                  // ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 24,
                    itemPadding: EdgeInsets.only(left: 0, right: 4.w),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rounded,
                      color: Color(0xffFFA740),
                      // size: 24,
                    ),
                    onRatingUpdate: (value) {
                      setModalState(() {
                        rating = value;
                      });
                    },
                  ),
                  SizedBox(height: 36.h),
                  Text(
                    'Your review',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: AppColors.textSecondary
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      hintText: "Write your review",
                      hintStyle: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: AppColors.textDisabled
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.w),
                        borderSide: BorderSide(width: 1, color: AppColors.borderBtn),
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.w)),
                            side: BorderSide(color: AppColors.borderThirsty, width: 1),
                            // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.khula(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 1,
                                color: AppColors.textBtn
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.w)),
                            // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                            backgroundColor: AppColors.btnPrimary,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Reschedule',
                            style: GoogleFonts.khula(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 1,
                                color: AppColors.textWhite
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.w)),
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
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 34.h),
                  Center(
                    child: Text(
                      'Notification',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: AppColors.textNormal,
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(
                          width: 1, color: AppColors.borderThirsty),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Activate notifications",
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 1,
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
                  SizedBox(height: 36.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.w)),
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
                          fontSize: 16,
                          letterSpacing: 1,
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
