import 'package:flutter/material.dart';
import 'package:medcare/util/constants/colors.dart';

class TransactionScreen extends StatelessWidget {
  final appointments = [
    {"date": "13", "month": "May", "price": "\$20,00", "status": "Paid"},
    {"date": "05", "month": "May", "price": "\$50,00", "status": "Paid"},
    {"date": "28", "month": "Mar", "price": "\$20,00", "status": "Paid"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgAlert,
        leading: Icon(Icons.arrow_back_ios, color: AppColors.textNormal),
        title: Text(
          'Transaction',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textNormal,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final item = appointments[index];
          return AppointmentCard(
            date: item["date"]!,
            month: item["month"]!,
            price: item["price"]!,
            status: item["status"]!,
          );
        },
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String date, month, price, status;

  AppointmentCard({
    required this.date,
    required this.month,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(1),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(month, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GP Consultation with Dr. Emily Smith",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  price,
                  style: TextStyle(
                    color: AppColors.textBtn,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.borderThirsty,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: AppColors.bgPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
