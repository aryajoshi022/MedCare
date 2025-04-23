import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String location;

  const HospitalCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(location),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
