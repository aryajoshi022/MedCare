import 'package:flutter/material.dart';
import 'package:medcare/util/constants/colors.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationScreen(),
    theme: ThemeData.dark(),
  ));
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
      message: "Hi [User's Name], this is a reminder for your consultation appointment with Dr. [...]",
    ),
    NotificationItem(
      icon: Icons.medical_services,
      iconBgColor: Colors.purple,
      title: "New Medical Record Notification",
      message: "Hello [User's Name], you have a new medical record added to your profile. Ple...",
    ),
    NotificationItem(
      icon: Icons.local_pharmacy,
      iconBgColor: Colors.teal[200]!,
      title: "Medication Pickup Reminder",
      message: "Good morning [User's Name], don't forget to pick up your daily dose of medication,...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: notifications.isEmpty
            ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/profile/empty_notification.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'There is nothing here',
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(height: 16,),
              Text('We’ll use this space to alert you on \norders and promos',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textSecondary),)
            ],
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.black,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: NotificationCard(item: item),
            );
          },
        ),
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
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: item.iconBgColor,
          child: Icon(item.icon, color: Colors.white),
        ),
        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item.message,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}