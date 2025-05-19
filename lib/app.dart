import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/MedicationReminder/medication_reminder.dart';
import 'package:medcare/screens/healthshop/healthshopscreens.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/screens/profile/health_history_screen.dart';
import 'package:medcare/splashscreen.dart';
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
          // home: const HomeScreen(),
          home: const HealthHistoryScreen(),
          // home: SplashScreen(),
          // home: ChatDoctor(),
          // home: DoctorDetails(),
          //  home: HealthShopScreen(),
          //home: DescriptionScreen(),
          // home: MedicationDetailsScreen(),
          // home: MedicationReminder(),

          routes: {},
        );
      },
    );
  }
}
