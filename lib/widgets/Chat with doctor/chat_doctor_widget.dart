import 'package:flutter/material.dart';

class ChatDoctorCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String specialization;

  const ChatDoctorCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 24),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(specialization, style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const Spacer(),
            Icon(Icons.chat, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
