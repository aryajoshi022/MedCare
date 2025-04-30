import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import 'package:medcare/screens/chatdoctor/doctor_details.dart';
import 'package:medcare/screens/healthshop/healthshopscreens.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/util/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926), // Match Figma design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'MedCare',
          themeMode: ThemeMode.light,
          theme: AppTheme.lighttheme,
          debugShowCheckedModeBanner: false,
          //const HomeScreen(),
          // home: SplashScreen(),
          // home: ChatDoctor(),
          // home: DoctorDetails(),
          home: HealthShopScreen(),
          routes: {},
        );
      },
    );
  }
}
