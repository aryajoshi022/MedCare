import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/bottom bar/custom_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text.rich(
              TextSpan(
                text: 'Hi, ',
                style: GoogleFonts.khula(
                  color: Color(0xff090909),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: 'Alexander', // bold text
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), // Automatically pushes the icons to the right
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Image.asset('assets/icons/bell.png', height: 24.h),
                  onPressed: () {
                    // Bell action
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/icons/cart.png', height: 24.h),
                  onPressed: () {
                    // Cart action
                  },
                ),
              ],
            ),
          ],
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
      body: Column(
        children: [],
      ),
    );
  }
}
