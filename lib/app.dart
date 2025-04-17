import 'package:flutter/material.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sonic AI',
      themeMode: ThemeMode.dark,
      //theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      // home: //GoogleSignInScreen(),
      // home: SplashScreen(),
      home: ChatDoctor(),
      routes: {},
    );
  }
}
