import 'package:flutter/material.dart';
import 'package:medcare/util/constants/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationItem> notifications = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgAlert,
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            return NotificationCard(item: item);
          },
        ),
      ),
    );
  }
}

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

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: item.iconBgColor,
          child: Icon(item.icon, color: Colors.white),
        ),
        title: Text(
          item.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.bgAlert,
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

Widget Empty_notification() {
  return Scaffold(
    body: SafeArea(
      child: Column(
        children: [Image.asset('assets/images/profile/empty_notification.png')],
      ),
    ),
  );
}
