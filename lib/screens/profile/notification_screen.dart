import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/profile/profile_screen.dart';
import 'package:medcare/util/constants/colors.dart';
import 'package:medcare/widgets/bottom%20bar/custom_bottom_bar.dart';

class NotificationItem {
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String message;

  NotificationItem({
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.message,
  });
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      icon: Icons.notifications,
      iconBgColor: Colors.blue[700]!,
      title: "Doctor Appointment Reminder",
      message:
          "Hi [User's Name], this is a reminder for your consultation appointment with Dr. [...]",
    ),
    NotificationItem(
      icon: Icons.medical_services,
      iconBgColor: Colors.purple,
      title: "New Medical Record Notification",
      message:
          "Hello [User's Name], you have a new medical record added to your profile. Ple...",
    ),
    NotificationItem(
      icon: Icons.local_pharmacy,
      iconBgColor: Colors.teal[200]!,
      title: "Medication Pickup Reminder",
      message:
          "Good morning [User's Name], don't forget to pick up your daily dose of medication,...",
    ),
  ];
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgAlert,
        leading: IconButton(
          padding: EdgeInsets.only(left: 28.w),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Icon(Icons.chevron_left,
            color: AppColors.btnSecondary,
            size: 24.sp,
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textNormal,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child:
              notifications.isEmpty
                  ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/profile/empty_notification.png',
                          width: 200.w,
                          height: 200.h
                        ),
                         SizedBox(height: 20.h),
                         Text(
                          'There is nothing here',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(width: 250.w,
                          height: 50.h,
                          child: Text(
                            'We’ll use this space to alert you on orders and promos',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final item = notifications[index];
                      return Dismissible(
                        key: Key(item.title),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            notifications.removeAt(index);
                          });
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          color: Colors.black,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: NotificationCard(item: item),
                      );
                    },
                  ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      elevation: 0.0,
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: item.iconBgColor,
          child: Icon(item.icon, color: Colors.white),
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          item.message,
          maxLines: 2,
          style: TextStyle(color: AppColors.textDisabled),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
