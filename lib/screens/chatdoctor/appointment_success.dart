import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentSuccess extends StatefulWidget {
  const AppointmentSuccess({super.key});

  @override
  State<AppointmentSuccess> createState() => _AppointmentSuccessState();
}

class _AppointmentSuccessState extends State<AppointmentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.asset('assets/images/AppointmentSuccess.png',
                width: 172.26.w,
                height: 155.57.h,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
