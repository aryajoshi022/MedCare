import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          home: SplashScreen(),
          routes: {},
        );
      },
    );
  }
}
