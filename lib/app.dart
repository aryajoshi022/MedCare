import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import 'package:medcare/splashscreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428,926), // Match Figma design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'MedCare',
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          // home: const HomeScreen(),
          home: SplashScreen(),
          //home: ChatDoctor(),
          routes: {},
        );
      },
    );
  }
}
