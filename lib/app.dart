import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/MedicationReminder/medication_reminder.dart';
import 'package:medcare/screens/healthshop/healthshopscreens.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/screens/profile/health_history_screen.dart';
import 'package:medcare/screens/profile/notification_screen.dart';
import 'package:medcare/screens/profile/prescription_history.dart';
import 'package:medcare/screens/profile/profile_screen.dart';
import 'package:medcare/screens/profile/transaction_screen.dart';
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
          // home: HealthHistoryScreen(),
          // home: TransactionScreen(),
          home: const HomeScreen(),
          // home: SplashScreen(),
          // home: ChatDoctor(),
          // home: DoctorDetails(),
          // home: HealthShopScreen(),
          //home: DescriptionScreen(),
          // home: MedicationDetailsScreen(),
          // home: MedicationReminder(),
          routes: {},
        );
      },
    );
  }
}
