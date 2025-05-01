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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentSuccess(),));
            },
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
          const Spacer(flex: 3,)
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
        _buildAppointmentCard(
          leadingText: '1 Minggu yang akan datang',
          doctorName: 'Dr. Giovanni Bianchi',
          specialty: 'General Surgery',
          date: 'Wednesday, 29 Feb 04.00 pm',
          location: 'Bella Vista Surgery Clinic, Via\nGaribaldi 10, Milan, Italy',
          notificationsOn: true,
          actionLabel: 'Notification',
          onAction: _showNotificationPermissionSheet,
        ),
        SizedBox(height: 8.h),
        _buildAppointmentCard(
          doctorName: 'Dr. Luca Rossi',
          specialty: 'Cardiology Specialist',
          date: 'Wednesday, 22 Feb 1.00 pm',
          location: 'Rossi Cardiology Clinic\nVia Garibaldi 15, Milan, Italy',
          notificationsOn: false,
          actionLabel: 'Reschedule',
          onAction: _showRescheduleSheet,
        ),
      ],
    );
  }

  Widget _buildCompletedAppointmentsList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildAppointmentCard(
          doctorName: 'Dr. Giovanni Bianchi',
          specialty: 'General Surgery',
          date: 'Wednesday, 29 Feb 04.00 pm',
          location: 'Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy',
          notificationsOn: null,
          actionLabel: 'Add Review',
          onAction: _showReviewSheet,
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          doctorName: 'Dr. Giovanni Bianchi',
          specialty: 'General Surgery',
          date: 'Wednesday, 29 Feb 04.00 pm',
          location: 'Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy',
          notificationsOn: null,
          actionLabel: 'Next Appointment',
          onAction: _showReviewSheet,
        ),
      ],
    );
  }

  Widget _buildAppointmentCard({
    String? leadingText,
    required String doctorName,
    required String specialty,
    required String date,
    required String location,
    bool? notificationsOn,
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    return Container(
      // padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leadingText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                leadingText,
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 1,
                  color: AppColors.textSecondary
                ),
              ),
            ),
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
                  children: [
                    Expanded(
                      child: Column(
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
                    ),
                    CircleAvatar(
                      radius: 22.w,
                      backgroundColor: AppColors.borderSecondary,
                      child: CircleAvatar(
                        radius: 18.w,
                        backgroundImage: AssetImage('assets/images/Dr_Luca_Rossi.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Divider(color: AppColors.borderBtn),
                SizedBox(height: 20.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          SizedBox(height: 12.h),
                          Text(date,
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
                    // SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location',
                            style: GoogleFonts.khula(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                letterSpacing: 1,
                                color: AppColors.textDisabled
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(location,
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
                ),
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
            child:  Row(
              children: [
                if (notificationsOn != null) ...[
                  Image.asset('assets/icons/cart.png',
                    height: 16.h,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 4.w),
                  Text('Notifications',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 1,
                        color: AppColors.textSecondary
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    notificationsOn ? 'On' : 'Off',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 1,
                        color: AppColors.textBtn
                    ),
                  ),
                ],
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAction,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                      backgroundColor: AppColors.btnPrimary,
                      foregroundColor: AppColors.textWhite,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.w)),
                    ),
                    child: Text(actionLabel),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void _showNotificationPermissionSheet() {
  }

  void _showRescheduleSheet() {
  }

  void _showReviewSheet() {
  }
}
