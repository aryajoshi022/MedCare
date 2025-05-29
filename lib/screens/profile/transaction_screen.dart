import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/profile/profile_screen.dart';
import 'package:medcare/util/constants/colors.dart';
import 'package:medcare/widgets/bottom%20bar/custom_bottom_bar.dart';

class TransactionScreen extends StatefulWidget {
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final appointments = [
    {"date": "13", "month": "May", "price": "\$20,00", "status": "Paid"},
    {"date": "05", "month": "May", "price": "\$50,00", "status": "Paid"},
    {"date": "28", "month": "Mar", "price": "\$20,00", "status": "Paid"},
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
          'Transaction',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textNormal,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:25.w ),
        child: ListView.builder(
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

class AppointmentCard extends StatelessWidget {
  final String date, month, price, status;

  AppointmentCard({
    required this.date,
    required this.month,
    required this.price,
    required this.status,
  });
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(1.r),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Text(month, style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GP Consultation with Dr. Emily Smith",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  price,
                  style: TextStyle(
                    color: AppColors.textBtn,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.borderThirsty,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: AppColors.bgPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),

    );
  }

}
